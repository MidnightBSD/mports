--- html5rdf/treewalkers/__init__.py.orig
+++ html5rdf/treewalkers/__init__.py
@@ -102,7 +102,8 @@
             indent += 2
             # attributes (sorted for consistent ordering)
             attrs = token["data"]
-            for (namespace, localname), value in sorted(attrs.items()):
+            for (namespace, localname), value in sorted(
+                    attrs.items(), key=lambda item: (item[0][0] is not None, item[0][0] or "", item[0][1])):
                 if namespace:
                     if namespace in constants.prefixes:
                         ns = constants.prefixes[namespace]
