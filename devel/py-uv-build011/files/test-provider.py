"""Exercise the staged backend and its staged native helper."""
import importlib.metadata
import os
from pathlib import Path
import subprocess
import sys
import tarfile
import zipfile

private = Path(sys.argv[1]).resolve()
work = Path(sys.argv[2]).resolve()
import uv_build
assert Path(uv_build.__file__).resolve().is_relative_to(private)
assert importlib.metadata.version('uv-build') == '0.11.16'
helper = private / 'bin' / 'uv-build'
assert helper.is_file()
work.mkdir(parents=True, exist_ok=True)
(work / 'src' / 'probe').mkdir(parents=True, exist_ok=True)
(work / 'src' / 'probe' / '__init__.py').write_text('value = 42\n')
(work / 'pyproject.toml').write_text('''[build-system]
requires = ["uv-build>=0.11.16,<0.12"]
build-backend = "uv_build"
[project]
name = "probe"
version = "1.0"
''')
env = os.environ.copy()
env['PYTHONPATH'] = str(private)
env['PATH'] = str(private / 'bin') + os.pathsep + env.get('PATH', '')
subprocess.run([sys.executable, '-c', 'import uv_build; print(uv_build.get_requires_for_build_wheel({})); print(uv_build.get_requires_for_build_sdist({}))'], cwd=work, env=env, check=True)
subprocess.run([sys.executable, '-m', 'build', '--no-isolation', '--wheel', '--sdist'], cwd=work, env=env, check=True)
assert len(list((work / 'dist').glob('probe-1.0-*.whl'))) == 1
sdist = work / 'dist' / 'probe-1.0.tar.gz'
assert sdist.is_file()
with zipfile.ZipFile(next((work / 'dist').glob('probe-1.0-*.whl'))) as archive:
    assert archive.read('probe/__init__.py') == b'value = 42\n'
with tarfile.open(sdist) as archive:
    assert archive.extractfile('probe-1.0/src/probe/__init__.py').read() == b'value = 42\n'
print('private backend and native helper built wheel and sdist')
