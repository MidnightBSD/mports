--- sphinxcontrib/adadomain.py.orig
+++ sphinxcontrib/adadomain.py
@@ -491,8 +491,8 @@
         """
         if not name:
             return None, None
-        if ":" not in name:
-            name = "%s:%s" % (modname, name)
+        if '.' not in name:
+            name = '%s.%s' % (modname or 'ada', name)
 
         if name in self.data['objects']:
             return name, self.data['objects'][name][0]
