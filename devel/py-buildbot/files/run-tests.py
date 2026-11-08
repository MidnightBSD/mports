import os
import runpy
import sys
from pathlib import Path

import buildbot
import buildbot.test

source = Path(sys.argv[1])
stage = Path(sys.argv[2]).resolve()
if os.path.commonpath([Path(buildbot.__file__).resolve(), stage]) != str(stage):
    raise RuntimeError("buildbot was not imported from the stage")
print("Staged Buildbot:", buildbot.__file__, flush=True)
# The wheel omits much of the original test suite. Use the source tests,
# while production imports continue to resolve through the staged package.
buildbot.test.__path__[:] = [str(source / "buildbot" / "test")]
sys.argv = [sys.argv[0]] + (sys.argv[3:] or ["buildbot.test"])
runpy.run_module("twisted.trial", run_name="__main__")
