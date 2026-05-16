--- pandas/_libs/tslibs/np_datetime.pyx.orig	2023-04-24 00:14:41 UTC
+++ pandas/_libs/tslibs/np_datetime.pyx
@@ -279,7 +279,7 @@ cdef int string_to_dts(
     int* out_local,
     int* out_tzoffset,
     bint want_exc,
-    format: str | None=None,
+    object format = None,
     bint exact=True,
 ) except? -1:
