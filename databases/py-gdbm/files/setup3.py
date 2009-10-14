#!/usr/bin/env python
# To use:
#       python setup.py install
#

__version__ = "$FreeBSD: ports/databases/py-gdbm/files/setup3.py,v 1.1 2009/07/08 09:12:46 lwhsu Exp $"

try:
    import distutils
    from distutils import sysconfig
    from distutils.command.install import install
    from distutils.core import setup, Extension
except:
    raise SystemExit("Distutils problem")

prefix = sysconfig.PREFIX
inc_dirs = [prefix + "/include"]
lib_dirs = [prefix + "/lib"]
libs = ["gdbm"]

setup(name = "gdbm",
      description = "GDBM Extension to Python",
      
      ext_modules = [Extension('gdbm', ['_gdbmmodule.c'],
                               include_dirs = inc_dirs,
                               libraries = libs,
                               library_dirs = lib_dirs)]
      )
