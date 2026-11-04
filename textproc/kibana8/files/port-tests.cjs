'use strict';

// Port checks can run on an older host Node. Version-policy checks execute the
// shipped validator in an isolated VM; they do not certify this host runtime.
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const vm = require('node:vm');
const { createRequire } = require('node:module');
const { spawnSync } = require('node:child_process');

assert(process.argv[2], 'usage: node port-tests.cjs WRKSRC');
const root = fs.realpathSync(process.argv[2]);
const pkg = JSON.parse(fs.readFileSync(path.join(root, 'package.json'), 'utf8'));
const validator = path.join(root, 'node_modules/@kbn/setup-node-env/node_version_validator.js');
const validatorSource = fs.readFileSync(validator, 'utf8');
const requireFromValidator = createRequire(validator);
let failures = 0;
let checks = 0;

function check(name, run) {
  checks++;
  try {
    run();
    console.log('ok - ' + name);
  } catch (error) {
    failures++;
    console.error('not ok - ' + name + ': ' + error.message);
  }
}

check('distribution declares the supported minimum Node version', () => {
  assert.equal(pkg.engines.node, '24.21.0');
});

// Exercise the real validator and its real semver dependency, changing only
// process.version. An exit throws so execution stops as it does in a subprocess.
for (const [version, accepted] of [
  ['v24.21.0', true],
  ['v24.21.1', true],
  ['v24.22.0', true],
  ['v24.20.9', false],
  ['v24.13.0', false],
  ['v25.0.0', false],
  ['v23.99.0', false],
  ['v24.21.0-rc.1', false],
  ['v24.22.0-rc.1', false],
  ['not-a-version', false],
  ['', false],
  [undefined, false],
]) {
  check('validator ' + (accepted ? 'accepts ' : 'rejects ') + String(version), () => {
    const messages = [];
    const exitSignal = {};
    let exitCode;
    try {
      vm.runInNewContext(validatorSource, {
        __filename: validator,
        require: requireFromValidator,
        process: {
          version,
          exit(code) { exitCode = code; throw exitSignal; },
        },
        console: { error(message) { messages.push(message); } },
      }, { filename: validator });
    } catch (error) {
      if (error !== exitSignal) throw error;
    }
    if (accepted) {
      assert.equal(exitCode, undefined, messages.join('\n'));
      assert.deepEqual(messages, []);
    } else {
      assert.equal(exitCode, 1, 'invalid runtime must terminate with status 1');
      assert.equal(messages.length, 1);
      assert.match(messages[0], /Kibana does not support the current Node\.js version/);
      assert.match(messages[0], /24\.21\.0/);
    }
  });
}

check('foreign Node, native nice addon, and Chromium payloads are excluded', () => {
  for (const relative of [
    'node',
    'node_modules/@napi-rs/nice-linux-x64-gnu',
    'node_modules/@kbn/screenshotting-plugin/chromium/headless_shell-linux_x64',
  ]) {
    assert(!fs.existsSync(path.join(root, relative)), relative + ' must not be packaged');
  }
});

check('portable QuickJS and source-map WebAssembly payloads are retained', () => {
  const files = [
    'node_modules/quickjs-wasi/quickjs.wasm',
    'node_modules/elastic-apm-node/node_modules/source-map/lib/mappings.wasm',
  ];
  const extensionRoot = path.join(root, 'node_modules/quickjs-wasi/extensions');
  for (const name of ['base64', 'crypto', 'encoding', 'headers', 'structured-clone', 'url']) {
    files.push(path.relative(root, path.join(extensionRoot, name, name + '.so')));
  }
  for (const relative of files) {
    const bytes = fs.readFileSync(path.join(root, relative));
    assert.equal(bytes.subarray(0, 4).toString('hex'), '0061736d', relative + ' is WebAssembly');
    assert(WebAssembly.validate(bytes), relative + ' must be valid WebAssembly');
  }
});

check('distribution contains no foreign native executables or addons', () => {
  const foreignMagic = new Set(['7f454c46', 'feedface', 'feedfacf', 'cefaedfe', 'cffaedfe', 'cafebabe', 'bebafeca']);
  const pending = [root];
  const header = Buffer.alloc(4);
  while (pending.length) {
    const directory = pending.pop();
    for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
      const filename = path.join(directory, entry.name);
      if (entry.isDirectory()) {
        pending.push(filename);
      } else if (entry.isFile()) {
        assert(!filename.endsWith('.node'), path.relative(root, filename) + ' is a native addon');
        const fd = fs.openSync(filename, 'r');
        try {
          const size = fs.readSync(fd, header, 0, 4, 0);
          assert(size !== 4 || !foreignMagic.has(header.toString('hex')),
            path.relative(root, filename) + ' is a foreign native binary');
        } finally {
          fs.closeSync(fd);
        }
      }
    }
  }
});

// Run the actual launchers against a recording executable in a disposable
// installation layout. No Kibana server, keystore, or listening socket starts.
check('launchers resolve symlinks, config options, arguments, and Node location', () => {
  const fixture = fs.mkdtempSync(path.join(os.tmpdir(), 'kibana-port-launcher-'));
  try {
    const home = path.join(fixture, 'kibana');
    const config = path.join(fixture, 'custom-config');
    fs.mkdirSync(path.join(home, 'bin'), { recursive: true });
    fs.mkdirSync(path.join(home, 'node/glibc-217/bin'), { recursive: true });
    fs.mkdirSync(path.join(fixture, 'links'));
    fs.mkdirSync(config);
    fs.writeFileSync(path.join(config, 'node.options'), '# ignored comment\n--stack-trace-limit=37\n');
    const recorder = path.join(home, 'node/glibc-217/bin/node');
    fs.writeFileSync(recorder, '#!/bin/sh\nprintf "%s\\n" "$NODE_ENV" "$KBN_PATH_CONF" "$NODE_OPTIONS" "$@"\n');
    fs.chmodSync(recorder, 0o755);
    const entrypoints = {
      kibana: 'kibana',
      'kibana-encryption-keys': 'encryption_keys',
      'kibana-health-gateway': 'health_gateway',
      'kibana-keystore': 'keystore',
      'kibana-plugin': 'plugin',
      'kibana-setup': 'setup',
      'kibana-verification-code': 'verification_code',
    };
    for (const [name, entrypoint] of Object.entries(entrypoints)) {
      fs.copyFileSync(path.join(root, 'bin', name), path.join(home, 'bin', name));
      fs.chmodSync(path.join(home, 'bin', name), 0o755);
      const link = path.join(fixture, 'links', name);
      fs.symlinkSync('../kibana/bin/' + name, link);
      const result = spawnSync('/bin/sh', [link, '--help', 'argument with spaces'], {
        encoding: 'utf8',
        env: { ...process.env, KBN_PATH_CONF: config, NODE_OPTIONS: '--trace-warnings' },
      });
      assert.equal(result.status, 0, name + ': ' + result.stderr);
      const lines = result.stdout.trimEnd().split('\n');
      assert.equal(lines[0], 'production', name);
      assert.equal(lines[1], config, name);
      assert(lines[2].includes('--stack-trace-limit=37'), name + ' must load node.options');
      assert(lines[2].includes('--trace-warnings'), name + ' must preserve NODE_OPTIONS');
      assert.equal(path.resolve(lines[3]), path.join(home, 'node_modules/@kbn/cli', entrypoint, 'dist'), name);
      assert.deepEqual(lines.slice(4), ['--help', 'argument with spaces'], name);
    }
  } finally {
    fs.rmSync(fixture, { recursive: true, force: true });
  }
});

console.log('Host Node ' + process.version + '; isolated checks do not establish Kibana runtime compatibility.');
console.log(checks + ' checks, ' + failures + ' failures');
process.exitCode = failures ? 1 : 0;
