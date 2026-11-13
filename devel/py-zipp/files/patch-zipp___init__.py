--- zipp/__init__.py.orig
+++ zipp/__init__.py
@@ -111,9 +111,18 @@
 
     @staticmethod
     def _implied_dirs(names):
-        parents = itertools.chain.from_iterable(map(_parents, names))
-        as_dirs = (p + posixpath.sep for p in parents)
-        return _dedupe(_difference(as_dirs, names))
+        seen = set()
+
+        def parents():
+            for name in names:
+                for parent in _parents(name):
+                    # All ancestors of a seen parent were already visited.
+                    if parent in seen:
+                        break
+                    seen.add(parent)
+                    yield parent + posixpath.sep
+
+        return _dedupe(_difference(parents(), names))
 
     def namelist(self):
         names = super().namelist()
