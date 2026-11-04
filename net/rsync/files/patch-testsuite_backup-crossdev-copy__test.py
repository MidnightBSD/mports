--- testsuite/backup-crossdev-copy_test.py.orig	2026-08-13 00:02:58 UTC
+++ testsuite/backup-crossdev-copy_test.py
@@ -28,13 +28,14 @@ from rsyncfns import (
 # Find a writable directory on a different st_dev from SCRATCHDIR (typically
 # tmpfs at /dev/shm).  Without one the EXDEV path can't fire -- skip cleanly.
 scratch_dev = os.stat(SCRATCHDIR).st_dev
-TMPFS = None
+bak = None
 for cand in ('/dev/shm', '/run/shm', os.environ.get('TMPDIR', '/tmp')):
     try:
         if os.stat(cand).st_dev != scratch_dev and os.access(cand, os.W_OK):
-            TMPFS = cand
+            bak = tempfile.mkdtemp(prefix='rsync-bak-xdev-', dir=cand)
             break
     except OSError:
         continue
-if TMPFS is None:
+if bak is None:
     test_skipped("no writable cross-device dir (tmpfs) for --backup-dir EXDEV path")
+TMPFS = os.path.dirname(bak)
@@ -47,4 +48,2 @@ makepath(src, dst)
-bak = tempfile.mkdtemp(prefix='rsync-bak-xdev-', dir=TMPFS)
-
 # dst holds the items that will be BACKED UP; src holds different-typed
 # replacements so the generator deletes-with-backup before recreating.
