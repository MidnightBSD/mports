#!/usr/bin/env python3
"""Regression coverage for the native INDEX resolver's internal stream."""
import pathlib
import subprocess
import tempfile

source = pathlib.Path(__file__).resolve().parents[1] / 'make_index.c'
def row(pkg, origin, build='', run='', flavor=None, default=''):
    fields = [pkg, origin, '/usr/local', 'comment', '/descr', 'maintainer',
              'devel', '', '', '', build, run, 'https://example.org']
    if flavor is not None:
        fields += [flavor, default]
    return '|'.join(fields)

rows = [
    row('glib', '/ports/glib', build='/ports/gi@bootstrap', flavor='default', default='default'),
    row('glib-bootstrap', '/ports/glib', flavor='bootstrap', default='default'),
    row('gi', '/ports/gi', run='/ports/glib', flavor='default', default='default'),
    row('gi-bootstrap', '/ports/gi', run='/ports/glib@bootstrap', flavor='bootstrap', default='default'),
    row('py312-thing', '/ports/py-thing', flavor='py312', default='py312'),
    row('py313-thing', '/ports/py-thing', flavor='py313', default='py312'),
    row('consumer', '/ports/consumer', build='/ports/py-thing@py313 /ports/py-thing', flavor='', default=''),
    row('legacy', '/ports/legacy', run='/ports/py-thing@py312'),
]
with tempfile.TemporaryDirectory() as tmp:
    exe, stream = pathlib.Path(tmp) / 'resolver', pathlib.Path(tmp) / 'describe'
    subprocess.run(['cc', '-Wall', '-Wextra', '-o', str(exe), str(source)], check=True)
    def resolve(lines, success=True):
        stream.write_text('\n'.join(lines) + '\n')
        result = subprocess.run([str(exe), str(stream)], capture_output=True, text=True)
        assert (result.returncode == 0) == success, result.stderr
        return result
    a, b = resolve(rows), resolve(list(reversed(rows)))
    assert sorted(a.stdout.splitlines()) == sorted(b.stdout.splitlines())
    result = {line.split('|')[0]: line.split('|') for line in a.stdout.splitlines()}
    assert all(len(fields) == 13 for fields in result.values())
    assert result['glib'][7].split() == ['gi-bootstrap', 'glib-bootstrap']
    assert result['gi-bootstrap'][8].split() == ['glib-bootstrap']
    assert result['consumer'][7].split() == ['py312-thing', 'py313-thing']
    assert result['legacy'][8].split() == ['py312-thing']
    assert 'dependency cycle' not in a.stderr
    bad = resolve(rows + [row('bad', '/ports/bad', run='/ports/py-thing@missing')], False)
    assert '/ports/py-thing@missing' in bad.stderr
    cycle = resolve([row('a', '/ports/a', run='/ports/b'),
                     row('b', '/ports/b', run='/ports/a')], False)
    assert 'dependency cycle' in cycle.stderr
    duplicate = resolve(rows + [rows[4]], False)
    assert 'duplicate origin' in duplicate.stderr
print('make_index flavor regressions passed')
