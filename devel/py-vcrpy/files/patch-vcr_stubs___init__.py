--- vcr/stubs/__init__.py.orig	2026-06-26 12:23:12 UTC
+++ vcr/stubs/__init__.py
@@ -25,6 +25,14 @@
 
     def settimeout(self, *args, **kwargs):
         pass
+
+    def gettimeout(self):
+        return None
+
+    def recv(self, *args, **kwargs):
+        # Nothing is ever waiting to be read. urllib3-future (niquests) peeks at
+        # idle pooled connections with a non-blocking read before reusing them.
+        raise BlockingIOError
 
     def fileno(self):
         """
