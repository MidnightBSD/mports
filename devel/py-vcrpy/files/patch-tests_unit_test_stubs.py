--- tests/unit/test_stubs.py.orig	2025-12-08 14:39:17 UTC
+++ tests/unit/test_stubs.py
@@ -4,11 +4,20 @@
 from tempfile import NamedTemporaryFile
 from unittest import mock
 
-from pytest import mark
+from pytest import mark, raises
 
 from vcr import mode, use_cassette
 from vcr.cassette import Cassette
-from vcr.stubs import VCRHTTPSConnection
+from vcr.stubs import VCRFakeSocket, VCRHTTPSConnection
+
+
+def test_fake_socket_has_nothing_to_read():
+    # urllib3-future (niquests) peeks at idle pooled connections before reusing
+    # them: it saves the timeout, then tries a non-blocking read.
+    sock = VCRFakeSocket()
+    assert sock.gettimeout() is None
+    with raises(BlockingIOError):
+        sock.recv(65536)
 
 
 class TestVCRConnection:
