import os
import runpy
import sys
from pathlib import Path

import buildbot_worker

source = Path(sys.argv[1])
stage = Path(sys.argv[2])
if os.path.commonpath([os.path.realpath(buildbot_worker.__file__), os.path.realpath(stage)]) != os.path.realpath(stage):
    raise RuntimeError("buildbot_worker was not imported from the stage")
print("Staged worker:", buildbot_worker.__file__, flush=True)
buildbot_worker.__path__.append(str(source / "buildbot_worker"))
sys.argv = [sys.argv[0], "buildbot_worker.test"]
runpy.run_module("twisted.trial", run_name="__main__")
