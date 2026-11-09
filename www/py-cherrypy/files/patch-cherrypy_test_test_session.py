--- cherrypy/test/test_session.py
+++ cherrypy/test/test_session.py
@@ -436,7 +436,7 @@
 
     proc = watcher_getter(
         name='memcached',
-        arguments=['-p', str(port)],
+        arguments=['-l', '127.0.0.1', '-p', str(port)],
         checker=is_occupied,
         request=request,
     )
