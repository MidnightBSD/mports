--- cherrypy/test/test_config_server.py
+++ cherrypy/test/test_config_server.py
@@ -35,7 +35,7 @@
         cherrypy.tree.mount(Root())
 
         cherrypy.config.update({
-            'server.socket_host': '0.0.0.0',
+            'server.socket_host': '127.0.0.1',
             'server.socket_port': 9876,
             'server.max_request_body_size': 200,
             'server.max_request_header_size': 500,
