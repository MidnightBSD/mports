"""Install an unmodified Black wheel entirely outside global sys.path."""
import argparse
from pathlib import Path
import sys
from installer import install
from installer.destinations import SchemeDictionaryDestination
from installer.sources import WheelFile
from installer.utils import get_launcher_kind

parser = argparse.ArgumentParser()
parser.add_argument('--destdir', required=True)
parser.add_argument('--prefix', required=True)
parser.add_argument('--private-dir', required=True)
parser.add_argument('wheel')
a = parser.parse_args()
stage, prefix, private = (Path(x) for x in (a.destdir, a.prefix, a.private_dir))
if not all(x.is_absolute() for x in (stage, prefix, private)) or stage == Path('/'):
    parser.error('absolute non-root staging directory and absolute install paths required')
if not private.is_relative_to(prefix / 'lib') or 'site-packages' in private.parts:
    parser.error('formatter must stay in a private library directory outside site-packages')
scheme = {'purelib': str(private), 'platlib': str(private),
          'headers': str(private / 'include'), 'scripts': str(private / 'bin'),
          'data': str(private / 'data')}
with WheelFile.open(a.wheel) as source:
    if source.distribution != 'black':
        parser.error('expected canonical Black wheel')
    source.validate_record(validate_contents=True)
    destination = SchemeDictionaryDestination(
        scheme_dict=scheme, interpreter=sys.executable,
        script_kind=get_launcher_kind(), bytecode_optimization_levels=[0, 1],
        destdir=str(stage))
    install(source, destination, {'INSTALLER': b'mports\n'})

# Ensure private entry points select this distribution even when public Black is installed.
for name, module in (("black", "black"), ("blackd", "blackd")):
    script = stage / private.relative_to("/") / "bin" / name
    script.write_text(f"#!{sys.executable}\nimport sys\nfrom pathlib import Path\nsys.path.insert(0, str(Path(__file__).resolve().parent.parent))\nfrom {module} import patched_main\npatched_main()\n")
    script.chmod(0o755)

# Record the generated launchers with their actual contents.
import base64
import csv
import hashlib
record = stage / private.relative_to("/") / "black-25.1.0.dist-info" / "RECORD"
with record.open(newline="") as f:
    rows = list(csv.reader(f))
for row in rows:
    if row[0] in ("bin/black", "bin/blackd"):
        data = (record.parent.parent / row[0]).read_bytes()
        row[1] = "sha256=" + base64.urlsafe_b64encode(hashlib.sha256(data).digest()).rstrip(b"=").decode()
        row[2] = str(len(data))
with record.open("w", newline="") as f:
    csv.writer(f, lineterminator="\n").writerows(rows)
