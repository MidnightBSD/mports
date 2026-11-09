--- tests/test_graphite_bridge.py.orig
+++ tests/test_graphite_bridge.py
@@ -20,7 +20,7 @@
             def handle(s):
                 self.data = s.request.recv(1024)
 
-        server = SocketServer.TCPServer(('', 0), TCPHandler)
+        server = SocketServer.TCPServer(('127.0.0.1', 0), TCPHandler)
 
         class ServingThread(threading.Thread):
             def run(self):
