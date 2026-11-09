--- tornado/test/simple_httpclient_test.py.orig
+++ tornado/test/simple_httpclient_test.py
@@ -854,12 +854,12 @@
 
     def get_app(self):
         class LargeBody(RequestHandler):
-            def get(self):
+            async def get(self):
                 # Tornado manages Content-Length at the framework level, so
                 # detach the stream to emulate an HTTP/1.0 server that
                 # signals the end of the body by closing the connection.
                 stream = self.detach()
-                stream.write(b"HTTP/1.0 200 OK\r\n\r\n" + b"a" * (1024 * 100))
+                await stream.write(b"HTTP/1.0 200 OK\r\n\r\n" + b"a" * (1024 * 100))
                 stream.close()
 
         return Application([("/large", LargeBody)])
@@ -886,9 +886,9 @@
 
     def get_app(self):
         class LargeBody(RequestHandler):
-            def get(self):
+            async def get(self):
                 stream = self.detach()
-                stream.write(b"HTTP/1.0 200 OK\r\n\r\n" + b"a" * (1024 * 100))
+                await stream.write(b"HTTP/1.0 200 OK\r\n\r\n" + b"a" * (1024 * 100))
                 stream.close()
 
         return Application([("/large", LargeBody)])
