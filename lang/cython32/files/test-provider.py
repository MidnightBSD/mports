"""Compile and execute a native module using the selected private compiler."""
from pathlib import Path
import subprocess
import sys
import Cython
assert Cython.__version__ == "3.2.0", Cython.__version__
work = Path(sys.argv[1])
work.mkdir(parents=True, exist_ok=True)
(work / "native_probe.pyx").write_text("def square(long n):\n    return n * n\n")
(work / "setup.py").write_text("from setuptools import setup\nfrom Cython.Build import cythonize\nsetup(ext_modules=cythonize('native_probe.pyx', compiler_directives={'language_level': 3}))\n")
subprocess.run([sys.executable, "setup.py", "build_ext", "--inplace"], cwd=work, check=True)
subprocess.run([sys.executable, "-c", "import native_probe; assert native_probe.square(12)==144; assert native_probe.square(-7)==49"], cwd=work, check=True)
print("Private Cython 3.2.0 native compilation and execution passed")
