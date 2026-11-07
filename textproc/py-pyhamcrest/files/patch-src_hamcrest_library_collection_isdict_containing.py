--- src/hamcrest/library/collection/isdict_containing.py.orig
+++ src/hamcrest/library/collection/isdict_containing.py
@@ -52,7 +52,7 @@
         else:
             super().describe_match(item, match_description)
 
-    def _matching_keys(self, item):
+    def _matching_keys(self, item: Mapping[K, V]) -> MutableMapping[K, V]:
         key_matches: MutableMapping[K, V] = {}
         if hasmethod(item, "items"):
             for key, value in item.items():
