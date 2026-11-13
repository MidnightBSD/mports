--- cherrypy/_cprequest.py
+++ cherrypy/_cprequest.py
@@ -1,6 +1,7 @@
 import sys
 import time
 import collections
+from contextlib import ExitStack
 import operator
 from http.cookies import SimpleCookie, CookieError
 
@@ -518,6 +519,7 @@
         self.server_protocol = server_protocol
 
         self.closed = False
+        self._owned_resources = ExitStack()
 
         # Put a *copy* of the class error_page into self.
         self.error_page = self.error_page.copy()
@@ -537,8 +539,13 @@
         if not self.closed:
             self.closed = True
             self.stage = 'on_end_request'
-            self.hooks.run('on_end_request')
-            self.stage = 'close'
+            try:
+                self.hooks.run('on_end_request')
+            finally:
+                try:
+                    self._owned_resources.close()
+                finally:
+                    self.stage = 'close'
 
     def run(self, method, path, query_string, req_protocol, headers, rfile):
         r"""Process the Request. (Core)
