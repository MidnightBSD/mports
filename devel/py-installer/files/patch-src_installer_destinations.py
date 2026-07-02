--- src/installer/destinations.py.orig	2023-07-31 04:42:35 UTC
+++ src/installer/destinations.py
@@ -138,3 +138,4 @@ class SchemeDictionaryDestination(WheelDestination):
     def _path_with_destdir(self, scheme: Scheme, path: str) -> Path:
         target_dir = Path(self.scheme_dict[scheme]).resolve()
-        file = (target_dir / path).resolve()
+        file = target_dir / path
+        relative_path = Path(path)
@@ -142,1 +143,1 @@ class SchemeDictionaryDestination(WheelDestination):
-        if not file.is_relative_to(target_dir):
+        if relative_path.is_absolute() or ".." in relative_path.parts:
@@ -148,1 +149,1 @@ class SchemeDictionaryDestination(WheelDestination):
-            rel_path = file.relative_to(file.anchor)
+            rel_path = file.relative_to(target_dir.anchor)
