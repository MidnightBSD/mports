--- misc.ml.orig	2018-01-11 09:30:26 UTC
+++ misc.ml
@@ -58,3 +58,3 @@ let copy_hashtbl from_table to_table =
     struct
       type t = string
-      let compare = Stdlib.compare
+      let compare = Pervasives.compare
