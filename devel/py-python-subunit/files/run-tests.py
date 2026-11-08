import importlib
from pathlib import Path
import sys
import unittest

import subunit
from testscenarios import generate_scenarios

stage = Path(sys.argv[1])
source = Path(sys.argv[2])
if not Path(subunit.__file__).is_relative_to(stage):
    raise RuntimeError("subunit was not imported from the stage")
print("Staged subunit:", subunit.__file__, flush=True)

sys.path.insert(1, str(source / "python"))
tests = unittest.TestSuite()
loader = unittest.defaultTestLoader
for path in sorted((source / "python" / "tests").glob("test_*.py")):
    module = importlib.import_module("tests." + path.stem)
    tests.addTests(generate_scenarios(loader.loadTestsFromModule(module)))

print("Test cases:", tests.countTestCases(), flush=True)
result = unittest.TextTestRunner(verbosity=2).run(tests)
raise SystemExit(not result.wasSuccessful())
