--- Lib/fontTools/misc/treeTools.py.orig
+++ Lib/fontTools/misc/treeTools.py
@@ -1,7 +1,4 @@
 """Generic tools for working with trees."""
-
-from math import ceil, log
-
 
 def build_n_ary_tree(leaves, n):
     """Build N-ary tree from sequence of leaf nodes.
@@ -14,7 +11,11 @@
 
     assert n > 1
 
-    depth = ceil(log(len(leaves), n))
+    depth = 0
+    capacity = 1
+    while capacity < len(leaves):
+        capacity *= n
+        depth += 1
 
     if depth <= 1:
         return list(leaves)
