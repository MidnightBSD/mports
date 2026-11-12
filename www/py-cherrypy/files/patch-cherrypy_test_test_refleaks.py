--- cherrypy/test/test_refleaks.py
+++ cherrypy/test/test_refleaks.py
@@ -26,6 +26,8 @@
                 return 'Hello world!'
 
         cherrypy.tree.mount(Root())
+        # Keep the kernel listen backlog from rejecting the 25 test clients.
+        cherrypy.config.update({"server.socket_queue_size": 128})
 
     def test_threadlocal_garbage(self):
         if platform.system() == 'Darwin':
