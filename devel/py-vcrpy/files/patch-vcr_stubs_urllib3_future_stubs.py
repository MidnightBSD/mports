--- /dev/null
+++ vcr/stubs/urllib3_future_stubs.py
@@ -0,0 +1,18 @@
+"""Stubs for urllib3_future"""
+
+from urllib3_future.connection import HTTPConnection, VerifiedHTTPSConnection
+
+from ..stubs import VCRHTTPConnection, VCRHTTPSConnection
+
+# urllib3_future defines its own HTTPConnection classes. It includes polyfills
+# for newer features missing in older pythons.
+
+
+class VCRRequestsHTTPConnection(VCRHTTPConnection, HTTPConnection):
+    _baseclass = HTTPConnection
+    is_multiplexed = False
+
+
+class VCRRequestsHTTPSConnection(VCRHTTPSConnection, VerifiedHTTPSConnection):
+    _baseclass = VerifiedHTTPSConnection
+    is_multiplexed = False
