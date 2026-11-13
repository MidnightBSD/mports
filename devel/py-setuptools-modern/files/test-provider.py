"""Exercise a staged backend, exact requirements, PEP639, native code, coexistence."""
import email
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import zipfile

site, public, version, work, system_python = sys.argv[1:]
site, work = Path(site), Path(work)
work.mkdir(parents=True, exist_ok=True)
env = {k: v for k, v in os.environ.items()
       if not re.search(r'TOKEN|SECRET|PASSWORD|CREDENTIAL|^AWS_|^HF_|^GH_|^GITHUB_|^HUGGING|^AZURE_|^OPENAI_', k, re.I)}
env.update(PYTHONPATH=str(site) + os.pathsep + public, PYTHONNOUSERSITE='1',
           PYTHONDONTWRITEBYTECODE='1', HOME=str(work / 'home'))
Path(env['HOME']).mkdir(exist_ok=True)
for key, name in [('XDG_CONFIG_HOME', 'config'), ('XDG_CACHE_HOME', 'cache')]:
    directory = Path(env['HOME']) / name
    directory.mkdir(exist_ok=True)
    env[key] = str(directory)

def run(args, selected=True, cwd=work):
    e = dict(env)
    if not selected:
        e.pop('PYTHONPATH', None)
    z = subprocess.run(args, cwd=cwd, env=e, text=True,
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    print(z.stdout, end='')
    if z.returncode:
        raise SystemExit(z.returncode)

run([system_python, '-c', "import setuptools;assert setuptools.__version__=='63.1.0';print('global legacy63.1.0 remains selected')"], selected=False)
run([sys.executable, '-c', "import pathlib,setuptools,importlib.metadata as m;"
     "assert setuptools.__version__==" + repr(version) + ";"
     "assert pathlib.Path(setuptools.__file__).is_relative_to(" + repr(str(site)) + ");"
     "assert m.metadata('setuptools')['Name']=='setuptools';"
     "assert m.version('setuptools')==" + repr(version) + ";"
     "print('private canonical backend exact version and path verified')"])
fixture = work / 'native-pep639'
fixture.mkdir(exist_ok=True)
(fixture / 'pyproject.toml').write_text(
    '[build-system]\nrequires=["setuptools==' + version + '"]\n'
    'build-backend="setuptools.build_meta"\n'
    '[project]\nname="mports-setuptools-probe"\nversion="1.0"\n'
    'license="MIT"\nlicense-files=["LICENSE"]\n')
(fixture / 'LICENSE').write_text('SPDX-License-Identifier: MIT\n')
(fixture / 'setup.py').write_text(
    'from setuptools import setup,Extension\n'
    'setup(ext_modules=[Extension("provider_probe",["provider_probe.c"])])\n')
(fixture / 'provider_probe.c').write_text('''#include <Python.h>
static PyObject *answer(PyObject *self, PyObject *args) { return PyLong_FromLong(42); }
static PyMethodDef methods[] = {{"answer",answer,METH_NOARGS,NULL},{NULL,NULL,0,NULL}};
static struct PyModuleDef mod = {PyModuleDef_HEAD_INIT,"provider_probe",NULL,-1,methods};
PyMODINIT_FUNC PyInit_provider_probe(void) { return PyModule_Create(&mod); }
''')
run([sys.executable, '-m', 'build', '--no-isolation', '--wheel'], cwd=fixture)
wheel = next((fixture / 'dist').glob('*.whl'))
installed = work / 'native-wheel'
installed.mkdir(exist_ok=True)
with zipfile.ZipFile(wheel) as z:
    metadata = email.message_from_bytes(z.read(next(n for n in z.namelist() if n.endswith('.dist-info/METADATA'))))
    assert metadata['License-Expression'] == 'MIT'
    assert metadata['Name'] == 'mports-setuptools-probe'
    z.extractall(installed)
run([system_python, '-c', "import sys;sys.path.insert(0,"+repr(str(installed))+");import provider_probe;assert provider_probe.answer()==42;print('native extension and PEP639 metadata passed')"], selected=False)
run([system_python, '-c', "import setuptools;assert setuptools.__version__=='63.1.0';print('global legacy backend unchanged after native build')"], selected=False)
print(json.dumps({'setuptools': version, 'canonical_metadata': True, 'exact_build_requirement': True,
                  'pep639': True, 'native_extension_answer': 42, 'legacy_coexistence': True}))
