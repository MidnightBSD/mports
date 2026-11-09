--- tests/test_util.py.orig
+++ tests/test_util.py
@@ -34,7 +34,7 @@
     """HTTP server replying with the given responses to the expected
     requests."""
     def url(port, path):
-        return 'http://%s:%s%s' % (socket.gethostname().lower(), port, path)
+        return 'http://%s:%s%s' % ('127.0.0.1', port, path)
 
     responses = list(reversed(resp))
 
@@ -47,7 +47,7 @@
                 self.send_header(header, value)
             self.end_headers()
 
-    httpd = SocketServer.TCPServer(("", 0), MyHandler)
+    httpd = SocketServer.TCPServer(("127.0.0.1", 0), MyHandler)
     t = threading.Thread(target=httpd.serve_forever)
     t.daemon = True
     t.start()
@@ -106,7 +106,7 @@
     with start_server(
         Response(link, 301, {"Location": redirected}),
         Response(redirected, 301, {"Location": filtered})) as url:
-        hosts = [socket.gethostname().lower()]
+        hosts = ['127.0.0.1']
         assert filtered == follow_redirects(url(link), hosts)
 
 def test_follow_redirects_filtered_by_site_allowed():
@@ -115,7 +115,7 @@
     with start_server(
         Response(link, 301, {"Location": redirected}),
         Response(redirected, 200, {})) as url:
-        hosts = [socket.gethostname().lower()]
+        hosts = ['127.0.0.1']
         assert url(redirected) == follow_redirects(url(link), hosts)
 
 def test_expand_line():
