--- tests/test_twisted.py.orig
+++ tests/test_twisted.py
@@ -34,7 +34,7 @@
 
         root = Resource()
         root.putChild(b'metrics', MetricsResource(registry=self.registry))
-        server = reactor.listenTCP(0, Site(root))
+        server = reactor.listenTCP(0, Site(root), interface="127.0.0.1")
         self.addCleanup(server.stopListening)
 
         agent = Agent(reactor)
