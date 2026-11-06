"""Run real backend/frontend integrations without installing any host package.

Pass --backend SLOT=STAGED_PRIVATE_SITE to validate staged providers. Without
those overrides, the installed private providers are used. Work is retained.
"""
import argparse
import email
import json
import os
from pathlib import Path
import re
import shlex
import subprocess
import sys
import sysconfig
import zipfile

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--portsdir', type=Path, required=True)
p.add_argument('--workdir', type=Path, required=True)
p.add_argument('--extensions', type=Path)
p.add_argument('--scripts', type=Path)
p.add_argument('--backend', action='append', default=[])
a = p.parse_args()
backends = dict(x.split('=', 1) for x in a.backend)
a.workdir.mkdir(parents=True, exist_ok=True)
custom = a.workdir / 'custom module path with spaces'
custom.mkdir(exist_ok=True)
(custom / 'context_probe.py').write_text('VALUE = \'space "quote" retained\'\n')
env = {k: v for k, v in os.environ.items()
       if not re.search(r'TOKEN|SECRET|PASSWORD|CREDENTIAL|^AWS_|^HF_|^GH_|^GITHUB_|^HUGGING|^AZURE_|^OPENAI_', k, re.I)}
home = a.workdir / 'home'
home.mkdir(exist_ok=True)
(home / 'config').mkdir(exist_ok=True)
(home / 'cache').mkdir(exist_ok=True)
env.update(HOME=str(home), XDG_CONFIG_HOME=str(home/'config'),
           XDG_CACHE_HOME=str(home/'cache'), PYTHONNOUSERSITE='1',
           PYTHONDONTWRITEBYTECODE='1')
results = []

def fixture(name, selector, version, custom_command=None, pep517=True):
    port = a.workdir / name
    source = port / 'work/source'
    source.mkdir(parents=True, exist_ok=True)
    makefile = ('PORTNAME=helper-probe\nDISTVERSION=1.0\nCATEGORIES=devel\n'
                'MAINTAINER=ports@MidnightBSD.org\nCOMMENT=Backend integration fixture\n'
                'LICENSE=mit\nUSES=python python-setuptools:' + selector + '\n'
                'USE_PYTHON=' + ('pep517' if pep517 else '') + '\n'
                'NO_ARCH=yes\nWRKSRC=${WRKDIR}/source\n')
    if custom_command:
        makefile += 'PEP517_BUILD_CMD=' + custom_command + '\n'
    makefile += '.include <bsd.port.mk>\n'
    (port / 'Makefile').write_text(makefile)
    (source / 'pyproject.toml').write_text(
        '[build-system]\nrequires=["setuptools==' + version + '"]\n'
        'build-backend="setuptools.build_meta"\n[project]\n'
        'name="helper-probe"\nversion="1.0"\nlicense="MIT"\n'
        'license-files=["LICENSE"]\n[tool.setuptools]\npy-modules=["probe"]\n')
    (source / 'LICENSE').write_text('SPDX-License-Identifier: MIT\n')
    (source / 'probe.py').write_text('VALUE=42\n')
    (source / 'setup.py').write_text(
        'from pathlib import Path\nimport json,sys\n'
        'with Path("frontend-argv.jsonl").open("a") as f:f.write(json.dumps(sys.argv)+"\\n")\n'
        'from setuptools import setup\nsetup()\n')
    args = ['bmake', '-C', str(port), 'PORTSDIR=' + str(a.portsdir),
            'WRKDIR=' + str(port / 'work'), 'BATCH=yes',
            'DEPENDS_TARGET=python-setuptools-missing-dependency',
            'MAKE_ENV=PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=' + shlex.quote(str(custom))]
    if a.extensions:
        args += ['MPORTEXTENSIONS=' + str(a.extensions)]
    if a.scripts:
        args += ['SCRIPTSDIR=' + str(a.scripts)]
    if selector in backends:
        args += ['_PYTHON_SETUPTOOLS_PRIVATE=' + backends[selector]]
    return port, source, args


def run(args, target, label, success=True):
    z = subprocess.run(args + target, env=env, text=True,
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    log = a.workdir / (label + '.log')
    log.write_text(z.stdout)
    if success:
        assert z.returncode == 0, (label, z.returncode, log)
    else:
        assert z.returncode != 0, (label, 'unexpected success', log)
    results.append({'check': label, 'rc': z.returncode,
                    'expected_success': success, 'log': str(log)})
    return z.stdout

for selector, version in [('modern', '84.2.1'), ('83', '83.0.0'), ('78', '78.1.1')]:
    port, source, args = fixture('default-' + selector, selector, version)
    run(args, ['python-setuptools-build-env'], selector + '-venv')
    run(args + ['PEP517_BUILD_CONFIG_SETTING=--config-setting=--global-option=--quiet'],
        ['do-build'], selector + '-default-frontend-config-setting')
    argv = [json.loads(x) for x in (source / 'frontend-argv.jsonl').read_text().splitlines()]
    assert any('--quiet' in x for x in argv)
    with zipfile.ZipFile(next((source / 'dist').glob('*.whl'))) as z:
        m = email.message_from_bytes(z.read(next(n for n in z.namelist() if n.endswith('.dist-info/METADATA'))))
        assert m['License-Expression'] == 'MIT'
    query = run(args, ['-V', '${BUILD_DEPENDS}'], selector + '-declared-provider')
    assert ('setuptools-modern>=84.2.1' if selector == 'modern' else 'setuptools'+selector+'>='+version+'<'+('83.0.1' if selector=='83' else '78.1.2')) in query

value = 'argument with spaces and "quotes"'
legacy_vendor = str(Path(sysconfig.get_path('purelib')) / 'setuptools/_vendor')
code = ('import context_probe,sys;assert sys.prefix!=sys.base_prefix;assert '+repr(legacy_vendor)+' not in sys.path;assert context_probe.VALUE==\'space "quote" retained\';'
        'assert sys.argv[1]==' + repr(value) + ';open("custom-command-passed","w").write("yes")')
command = ('${PYTHON_SETUPTOOLS_CMD} -c ' + shlex.quote(code) + ' ' + shlex.quote(value)
           + ' && ${PYTHON_SETUPTOOLS_CMD} -m build --no-isolation --wheel')
port, source, args = fixture('custom-83', '83', '83.0.0', command)
run(args, ['python-setuptools-build-env'], 'custom-venv')
run(args, ['do-build'], 'custom-explicit-runner-spaces-quotes-sequence')
assert (source / 'custom-command-passed').read_text() == 'yes'

legacy = '${PYTHON_CMD} -c ' + shlex.quote("import setuptools;assert setuptools.__version__=='63.1.0'")
port, source, args = fixture('custom-untouched', '83', '83.0.0', legacy)
run(args, ['do-build'], 'custom-global-command-is-not-rewritten')
# Reusing the same released contract with an incompatible actual backend must
# fail normally; selecting83 must satisfy it without editing source metadata.
for selector, succeeds in [('modern', False), ('83', True)]:
    port, source, args = fixture('cap-contract-'+selector, selector, '83.0.0')
    project = source / 'pyproject.toml'
    text = project.read_text().replace('setuptools==83.0.0', 'setuptools>=77,<84.1')
    project.write_text(text)
    run(args, ['python-setuptools-build-env'], 'cap-'+selector+'-venv')
    run(args, ['do-build'], 'released-cap-'+selector, success=succeeds)
    assert project.read_text() == text
# Quoted private paths are supported as well as quoted command arguments.
if '83' in backends:
    alias = a.workdir / 'backend path with spaces'
    if alias.is_symlink():
        assert alias.resolve() == Path(backends['83']).resolve()
    else:
        assert not alias.exists()
        alias.symlink_to(Path(backends['83']), target_is_directory=True)
    port, source, args = fixture('private-path-spaces', '83', '83.0.0')
    args += ['_PYTHON_SETUPTOOLS_PRIVATE='+str(alias)]
    run(args, ['python-setuptools-build-env'], 'private-path-spaces-venv')
    run(args, ['do-build'], 'private-path-spaces-build')
# Full pipeline ordering must prepare the venv before the default build.
sequence = run(args, ['-V', '${_BUILD_REAL_SEQ}'], 'build-stage-order')
assert sequence.index('python-setuptools-build-env') < sequence.index('do-build')
port, source, args = fixture('default-unchanged', '83', '83.0.0')
makefile = port / 'Makefile'
makefile.write_text(makefile.read_text().replace(' python-setuptools:83', ''))
query = run(args, ['-V', '${PEP517_BUILD_CMD}', '-V', '${BUILD_DEPENDS}'], 'default-without-helper-unchanged')
assert 'run.sh' not in query and 'setuptools83' not in query

# Query-only boundary checks; older interpreters are not claimed as executed.
for selector, version, rel in [('modern','84.2.1','30900'),('83','83.0.0','30900'),('78','78.1.1','30800')]:
    port, source, args = fixture('guard-'+selector, selector, version)
    text = run(args + ['PYTHON_REL='+rel], ['-V', '${IGNORE}'], 'requires-python-'+selector)
    assert 'does not support Python' in text
port, source, args = fixture('guard-78-supported', '78', '78.1.1')
assert not run(args+['PYTHON_REL=30900'], ['-V', '${IGNORE}'], 'requires-python-78-allows39').strip()
port, source, args = fixture('missing-private-provider', '83', '83.0.0')
run(args, ['python-setuptools-build-env'], 'missing-provider-venv')
text = run(args+['_PYTHON_SETUPTOOLS_PRIVATE='+str(a.workdir/'not-installed')],
           ['do-build'], 'missing-provider-does-not-fallback', success=False)
assert 'selected private setuptools backend is not installed' in text
port, source, args = fixture('missing-pep517', '83', '83.0.0', pep517=False)
assert 'requires USE_PYTHON=pep517' in run(args, ['-V', '${IGNORE}'], 'reject-without-pep517')
port, source, args = fixture('invalid-selector', 'invalid', '83.0.0')
assert 'requires one argument' in run(args, ['-V', '${IGNORE}'], 'reject-invalid-selector')

a.workdir.joinpath('results.json').write_text(json.dumps(results, indent=2)+'\n')
print(json.dumps({'checks': len(results), 'failed': 0, 'workdir': str(a.workdir)}))
