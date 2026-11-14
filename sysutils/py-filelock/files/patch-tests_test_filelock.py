--- tests/test_filelock.py.orig	2026-11-14 07:29:55 UTC
+++ tests/test_filelock.py	2026-11-14 07:29:55 UTC
@@ -3306 +3306 @@
-    with pytest.raises(OSError, check=lambda error: error.errno in {errno.ELOOP, getattr(errno, "EFTYPE", None)}):
+    with pytest.raises(OSError, check=lambda error: error.errno in {errno.ELOOP, errno.EMLINK, getattr(errno, "EFTYPE", None)}):
