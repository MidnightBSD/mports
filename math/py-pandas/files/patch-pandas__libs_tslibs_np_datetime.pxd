--- pandas/_libs/tslibs/np_datetime.pxd.orig	2023-04-24 00:14:41 UTC
+++ pandas/_libs/tslibs/np_datetime.pxd
@@ -95,7 +95,7 @@ cdef int string_to_dts(
     int* out_local,
     int* out_tzoffset,
     bint want_exc,
-    format: str | None = *,
+    object format = *,
     bint exact = *
 ) except? -1
