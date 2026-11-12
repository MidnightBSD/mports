--- prometheus_client/exposition.py.orig
+++ prometheus_client/exposition.py
@@ -658,7 +658,7 @@
             # https://stackoverflow.com/a/28950776
             s.connect(('10.255.255.255', 1))
         else:
-            s.connect(('localhost', 0))
+            s.connect(('localhost', 1))
 
         return {'instance': s.getsockname()[0]}
 
