--- vcr/patch.py.orig	2026-06-16 21:40:41 UTC
+++ vcr/patch.py
@@ -155,6 +155,7 @@
             self._requests(),
             self._boto3(),
             self._urllib3(),
+            self._urllib3_future(),
             self._httplib2(),
             self._tornado(),
             self._aiohttp(),
@@ -288,6 +289,16 @@
 
         return self._urllib3_patchers(cpool, conn, urllib3_stubs)
 
+    def _urllib3_future(self):
+        try:
+            import urllib3_future.connection as conn
+            import urllib3_future.connectionpool as cpool
+        except ImportError:  # pragma: no cover
+            return ()
+        from .stubs import urllib3_future_stubs
+
+        return self._urllib3_patchers(cpool, conn, urllib3_future_stubs)
+
     @_build_patchers_from_mock_triples_decorator
     def _httplib2(self):
         try:
