#!/usr/bin/env python
# To use:
#       python setup.py install
#

__version__ = "$FreeBSD: ports/databases/py-sqlite3/files/setup.py,v 1.2 2006/08/07 02:23:05 perky Exp $"

try:
    import distutils
    from distutils import sysconfig
    from distutils.command.install import install
    from distutils.core import setup, Extension
except:
    raise SystemExit, "Distutils problem"

install.sub_commands = filter(lambda (cmd, avl): 'egg' not in cmd,
                              install.sub_commands)

prefix = sysconfig.PREFIX
inc_dirs = [prefix + "/include", "Modules/_sqlite"]
lib_dirs = [prefix + "/lib"]
libs = ["sqlite3"]
macros = [('MODULE_NAME', '"sqlite3"')]
sqlite_srcs = [
'_sqlite/cache.c',
'_sqlite/connection.c',
'_sqlite/cursor.c',
'_sqlite/microprotocols.c',
'_sqlite/module.c',
'_sqlite/prepare_protocol.c',
'_sqlite/row.c',
'_sqlite/statement.c',
'_sqlite/util.c']

setup(name = "_sqlite3",
      description = "SQLite 3 extension to Python",
      
      ext_modules = [Extension('_sqlite3', sqlite_srcs,
                               include_dirs = inc_dirs,
                               libraries = libs,
                               library_dirs = lib_dirs,
                               runtime_library_dirs = lib_dirs,
                               define_macros = macros)]
      )
