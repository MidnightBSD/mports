"""Check private selection, exact-pin wheel build, and public coexistence."""
import json
import os
from pathlib import Path
import subprocess
import sys
import zipfile

site, public, version, work, system_python = sys.argv[1:]
site, work = Path(site).resolve(), Path(work).resolve()
work.mkdir(parents=True, exist_ok=True)
env = dict(os.environ)
env.update(PYTHONNOUSERSITE='1', PYTHONDONTWRITEBYTECODE='1', HOME=str(work / 'home'))
Path(env['HOME']).mkdir(exist_ok=True)
for key, name in [('XDG_CONFIG_HOME', 'config'), ('XDG_CACHE_HOME', 'cache')]:
    directory = Path(env['HOME']) / name
    directory.mkdir(exist_ok=True)
    env[key] = str(directory)

def run(args, selected=False, cwd=work):
    e = dict(env)
    if selected:
        e['PYTHONPATH'] = str(site) + os.pathsep + public
    else:
        e.pop('PYTHONPATH', None)
    p = subprocess.run(args, cwd=cwd, env=e, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    print(p.stdout, end='', flush=True)
    if p.returncode:
        raise SystemExit(p.returncode)
    return p.stdout.strip()

probe = "import importlib.util,importlib.metadata as m,json,pathlib;spec=importlib.util.find_spec('hatchling');print(json.dumps(None if spec is None else {'version':m.version('hatchling'),'name':m.metadata('hatchling')['Name'],'path':str(pathlib.Path(spec.origin).resolve())}))"
before = json.loads(run([system_python, '-c', probe]))
assert before is None or not Path(before['path']).is_relative_to(site), before
selected = json.loads(run([sys.executable, '-c', probe], selected=True))
assert selected['name'] == 'hatchling' and selected['version'] == version, selected
assert Path(selected['path']).is_relative_to(site), selected
fixture = work / 'exact-pin'
fixture.mkdir(exist_ok=True)
(fixture / 'pyproject.toml').write_text('[build-system]\nrequires=["hatchling==' + version + '"]\nbuild-backend="hatchling.build"\n[project]\nname="mports-hatchling-probe"\nversion="1.0"\n[tool.hatch.build.targets.wheel]\nonly-include=["provider_probe.py"]\n')
(fixture / 'provider_probe.py').write_text('def answer():\n    return 42\n')
run([sys.executable, '-m', 'build', '--no-isolation', '--wheel'], selected=True, cwd=fixture)
wheels = list((fixture / 'dist').glob('mports_hatchling_probe-1.0-*.whl'))
assert len(wheels) == 1, wheels
installed = work / 'probe-wheel'
installed.mkdir(exist_ok=True)
with zipfile.ZipFile(wheels[0]) as z:
    z.extractall(installed)
run([system_python, '-c', 'import sys;sys.path.insert(0,' + repr(str(installed)) + ');import provider_probe;assert provider_probe.answer()==42;print("exact-pin wheel returned 42")'])
after = json.loads(run([system_python, '-c', probe]))
assert after == before, (before, after)
print(json.dumps({'private': selected, 'public_before': before, 'public_after': after, 'exact_pin_wheel_answer': 42}))
