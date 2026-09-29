--- Lib/tempfile.py.orig	2026-09-29 20:52:57 UTC
+++ Lib/tempfile.py
@@ -43,6 +43,7 @@ from random import Random as _Random
 import shutil as _shutil
 import errno as _errno
 from random import Random as _Random
+import stat as _stat
 import sys as _sys
 import types as _types
 import weakref as _weakref
@@ -277,16 +278,69 @@ def _dont_follow_symlinks(func, path, *args):
     elif not _os.path.islink(path):
         func(path, *args)
 
-def _resetperms(path):
+def _resetflags(path):
     try:
         chflags = _os.chflags
     except AttributeError:
         pass
     else:
         _dont_follow_symlinks(chflags, path, 0)
+
+def _resetperms(path):
+    _resetflags(path)
     _dont_follow_symlinks(_os.chmod, path, 0o700)
 
+# True if TemporaryDirectory._rmtree() can work relative to open directories
+# instead of resolving paths again.
+_rmtree_use_dir_fd = (
+    {_os.chmod, _os.unlink, _os.lstat} <= _os.supports_dir_fd
+    and _os.chmod in _os.supports_fd
+)
 
+def _resetperms_fd(dir_fd, path):
+    # Same as _resetperms(), but for the directory referred to by dir_fd.
+    if dir_fd is None:
+        _resetperms(path)
+        return
+    _resetflags(path)
+    _os.chmod(dir_fd, 0o700)
+
+try:
+    _nofollow_mode = _os.O_RDONLY | _os.O_NONBLOCK | _os.O_NOFOLLOW
+except AttributeError:
+    _nofollow_mode = None
+
+def _resetperms_at(name, dir_fd, path):
+    # Same as _resetperms(), but name is resolved relative to the directory
+    # file descriptor dir_fd. path is only used for os.chflags(), which
+    # doesn't support dir_fd or file descriptors.
+    if dir_fd is None:
+        _resetperms(path)
+        return
+    _resetflags(path)
+    if _os.chmod in _os.supports_follow_symlinks:
+        _os.chmod(name, 0o700, dir_fd=dir_fd, follow_symlinks=False)
+    else:
+        # dir_fd & follow_symlinks is not supported on this platform.
+        # Try chmod opening the file with O_NOFOLLOW.
+        if _nofollow_mode is not None:
+            try:
+                fd = _os.open(name, _nofollow_mode, dir_fd=dir_fd)
+            except OSError:
+                pass
+            else:
+                try:
+                    _os.chmod(fd, 0o700)
+                finally:
+                    _os.close(fd)
+                return
+        # If that did not work, we change by name, which is subject to a race
+        # condition.
+        stat = _os.lstat(name, dir_fd=dir_fd)
+        if not _stat.S_ISLNK(stat.st_mode):
+            _os.chmod(name, 0o700, dir_fd=dir_fd)
+
+
 # User visible interfaces.
 
 def gettempprefix():
@@ -893,23 +947,42 @@ class TemporaryDirectory:
             ignore_errors=self._ignore_cleanup_errors, delete=self._delete)
 
     @classmethod
-    def _rmtree(cls, name, ignore_errors=False, repeated=False):
-        def onexc(func, path, exc):
+    def _rmtree(cls, name, ignore_errors=False, repeated=False, dir_fd=None,
+                fullname=None):
+        if fullname is None:
+            fullname = name
+
+        def onexc(func, path, exc, direntry=None, dir_fd=None):
             if isinstance(exc, PermissionError):
                 if repeated and path == name:
                     if ignore_errors:
                         return
                     raise
 
+                # fullpath is path as seen from the working directory
+                fullpath = fullname + path[len(name):]
+                # base is path relative to dir_fd, the directory rmtree()
+                # reached it through, or the whole path when there is none
+                if dir_fd is None or not _rmtree_use_dir_fd:
+                    base, dir_fd = path, None
+                elif direntry is None:
+                    base = path
+                else:
+                    base = direntry.name
+
                 try:
                     if path != name:
-                        _resetperms(_os.path.dirname(path))
-                    _resetperms(path)
+                        # The parent directory of path is the one referred to
+                        # by dir_fd.
+                        _resetperms_fd(dir_fd, _os.path.dirname(fullpath))
+                    _resetperms_at(base, dir_fd, fullpath)
 
                     try:
-                        _os.unlink(path)
+                        _os.unlink(base, dir_fd=dir_fd)
                     except IsADirectoryError:
-                        cls._rmtree(path, ignore_errors=ignore_errors)
+                        cls._rmtree(base, ignore_errors=ignore_errors,
+                                    repeated=(path == name),
+                                    dir_fd=dir_fd, fullname=fullpath)
                     except PermissionError:
                         # The PermissionError handler was originally added for
                         # FreeBSD in directories, but it seems that it is raised
@@ -918,21 +991,27 @@ class TemporaryDirectory:
                         # raise NotADirectoryError and mask the PermissionError.
                         # So we must re-raise the current PermissionError if
                         # path is not a directory.
-                        if not _os.path.isdir(path) or _os.path.isjunction(path):
+                        if (not _os.path.isdir(fullpath)
+                                or _os.path.isjunction(fullpath)):
                             if ignore_errors:
                                 return
                             raise
-                        cls._rmtree(path, ignore_errors=ignore_errors,
-                                    repeated=(path == name))
+                        cls._rmtree(base, ignore_errors=ignore_errors,
+                                    repeated=(path == name),
+                                    dir_fd=dir_fd, fullname=fullpath)
                 except FileNotFoundError:
                     pass
+                except OSError:
+                    if ignore_errors:
+                        return
+                    raise
             elif isinstance(exc, FileNotFoundError):
                 pass
             else:
                 if not ignore_errors:
                     raise
 
-        _shutil.rmtree(name, onexc=onexc)
+        _shutil.rmtree(name, onexc=onexc, dir_fd=dir_fd, _onexc_kwargs=True)
 
     @classmethod
     def _cleanup(cls, name, warn_message, ignore_errors=False, delete=True):
