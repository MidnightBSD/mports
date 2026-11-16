--- src/lazr/restfulclient/resource.py.orig	2022-10-15 13:48:41 UTC
+++ src/lazr/restfulclient/resource.py
@@ -918,7 +918,7 @@ class Collection(Resource):
             raise ValueError(
                 "Collection slices must have a nonnegative " "start point."
             )
-        if stop < 0:
+        if stop is None or stop < 0:
             raise ValueError(
                 "Collection slices must have a definite, "
                 "nonnegative end point."
