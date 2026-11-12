--- cherrypy/_cpreqbody.py
+++ cherrypy/_cpreqbody.py
@@ -515,7 +515,11 @@
         By default, this will return a TemporaryFile. Override as needed.
         See also :attr:`cherrypy._cpreqbody.Part.maxrambytes`.
         """
-        return tempfile.TemporaryFile()
+        fileobj = tempfile.TemporaryFile()
+        request = cherrypy.serving.request
+        if request.stage not in (None, 'close'):
+            request._owned_resources.enter_context(fileobj)
+        return fileobj
 
     def fullvalue(self):
         """Return this entity as a string, whether stored in a file or not."""
