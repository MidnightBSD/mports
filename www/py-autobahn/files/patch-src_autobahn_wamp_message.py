--- src/autobahn/wamp/message.py.orig
+++ src/autobahn/wamp/message.py
@@ -776,5 +776,4 @@
         elif ser_id == "ubjson":
-            # The WAMP "ubjson" serializer is backed by bjdata (see serializer.py)
-            import bjdata as ubjson
+            import ubjson
 
             return ubjson.loadb(data_bytes)
