#!/usr/bin/env python
# To use:
#       python setup.py install
#

__version__ = "$FreeBSD: ports/databases/py-gdbm/files/setup.py,v 1.1 2001/03/01 12:24:19 tg Exp $"

try:
    import distutils
    from distutils import sysconfig
    from distutils.command.install import install
    from distutils.core import setup, Extension
except:
    raise SystemExit, "Distutils problem"

prefix = sysconfig.PREFIX
inc_dirs = [prefix + "/include"]
lib_dirs = [prefix + "/lib"]
libs = ["gdbm"]

setup(name = "gdbm",
      description = "GDBM Extension to Python",
      
      ext_modules = [Extension('gdbm', ['gdbmmodule.c'],
                               include_dirs = inc_dirs,
                               libraries = libs,
                               library_dirs = lib_dirs)]
      )
