"""Configure the bundled Skia using upstream's pathops feature selection."""
import runpy
import subprocess
import sys

builder, gn, output, cc, cxx = sys.argv[1:]
config = runpy.run_path(builder, run_name="skia_build_config")
args = config["SKIA_BUILD_ARGS"] + [
    f'cc="{cc}"',
    f'cxx="{cxx}"',
    'ar="/usr/bin/llvm-ar"',
]
subprocess.run(
    [gn, "gen", output, "--args=" + " ".join(args)],
    cwd=config["SKIA_SRC_DIR"],
    check=True,
)
