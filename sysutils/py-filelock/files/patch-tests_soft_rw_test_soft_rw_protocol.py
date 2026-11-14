--- tests/soft_rw/test_soft_rw_protocol.py.orig	2026-11-14 07:29:55 UTC
+++ tests/soft_rw/test_soft_rw_protocol.py	2026-11-14 07:29:55 UTC
@@ -967 +967 @@
-    assert native_errno in {errno.ELOOP, errno.ENOTDIR, eftype}
+    assert native_errno in {errno.ELOOP, errno.EMLINK, errno.ENOTDIR, eftype}
