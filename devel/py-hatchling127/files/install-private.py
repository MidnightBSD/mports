"""Install an unmodified hatchling wheel entirely outside global sys.path."""
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
if not (prefix / 'lib' == private or prefix / 'lib' in private.parents) or 'site-packages' in private.parts:
    parser.error('backend must stay in a private library directory outside site-packages')
scheme = {'purelib': str(private), 'platlib': str(private),
          'headers': str(private / 'include'), 'scripts': str(private / 'bin'),
          'data': str(private / 'data')}
with WheelFile.open(a.wheel) as source:
    if source.distribution != 'hatchling':
        parser.error('expected canonical hatchling wheel')
    source.validate_record(validate_contents=True)
    destination = SchemeDictionaryDestination(
        scheme_dict=scheme, interpreter=sys.executable,
        script_kind=get_launcher_kind(), bytecode_optimization_levels=[0, 1],
        destdir=str(stage))
    install(source, destination, {'INSTALLER': b'mports\n'})
