--- cherrypy/lib/static.py
+++ cherrypy/lib/static.py
@@ -126,6 +126,9 @@
     #   this way CP won't load the whole file in memory
     content_length = st.st_size
     fileobj = open(path, 'rb')
+    request = cherrypy.serving.request
+    if request.stage not in (None, 'close'):
+        request._owned_resources.enter_context(fileobj)
     return _serve_fileobj(fileobj, content_type, content_length, debug=debug)
 
 
