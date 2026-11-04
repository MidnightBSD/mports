--- Lib/shutil.py.orig	2026-09-29 20:52:56 UTC
+++ Lib/shutil.py
@@ -650,6 +650,7 @@ def _rmtree_safe_fd(stack, onexc):
     #   save a call to os.lstat() when walking subdirectories.
     func, dirfd, path, orig_entry = stack.pop()
     name = path if orig_entry is None else orig_entry.name
+    parent_fd = None if func is os.close else dirfd
     try:
         if func is os.close:
             os.close(dirfd)
@@ -697,21 +698,22 @@ def _rmtree_safe_fd(stack, onexc):
             except FileNotFoundError:
                 continue
             except OSError as err:
-                onexc(os.unlink, fullname, err)
+                onexc(os.unlink, fullname, err, direntry=entry, dir_fd=topfd)
     except FileNotFoundError as err:
         if orig_entry is None or func is os.close:
             err.filename = path
-            onexc(func, path, err)
+            onexc(func, path, err, direntry=orig_entry, dir_fd=parent_fd)
     except OSError as err:
         err.filename = path
-        onexc(func, path, err)
+        onexc(func, path, err, direntry=orig_entry, dir_fd=parent_fd)
 
 _use_fd_functions = ({os.open, os.stat, os.unlink, os.rmdir} <=
                      os.supports_dir_fd and
                      os.scandir in os.supports_fd and
                      os.stat in os.supports_follow_symlinks)
 
-def rmtree(path, ignore_errors=False, onerror=None, *, onexc=None, dir_fd=None):
+def rmtree(path, ignore_errors=False, onerror=None, *, onexc=None, dir_fd=None,
+           _onexc_kwargs=False):
     """Recursively delete a directory tree.
 
     If dir_fd is not None, it should be a file descriptor open to a directory;
@@ -734,24 +736,29 @@ def rmtree(path, ignore_errors=False, onerror=None, *,
 
     sys.audit("shutil.rmtree", path, dir_fd)
     if ignore_errors:
-        def onexc(*args):
+        def onexc(*args, **kwargs):
             pass
     elif onerror is None and onexc is None:
-        def onexc(*args):
+        def onexc(*args, **kwargs):
             raise
     elif onexc is None:
         if onerror is None:
-            def onexc(*args):
+            def onexc(*args, **kwargs):
                 raise
         else:
             # delegate to onerror
-            def onexc(*args):
+            def onexc(*args, **kwargs):
                 func, path, exc = args
                 if exc is None:
                     exc_info = None, None, None
                 else:
                     exc_info = type(exc), exc, exc.__traceback__
                 return onerror(func, path, exc_info)
+    elif not _onexc_kwargs:
+        # Only the internal caller in tempfile asks for the extra arguments.
+        _onexc = onexc
+        def onexc(func, path, err, **kwargs):
+            return _onexc(func, path, err)
 
     if _use_fd_functions:
         # While the unsafe rmtree works fine on bytes, the fd based does not.
