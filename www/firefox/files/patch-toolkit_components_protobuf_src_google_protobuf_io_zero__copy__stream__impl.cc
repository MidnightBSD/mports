--- toolkit/components/protobuf/src/google/protobuf/io/zero_copy_stream_impl.cc.orig	2026-08-10 14:46:00 UTC
+++ toolkit/components/protobuf/src/google/protobuf/io/zero_copy_stream_impl.cc
@@ -13,2 +13,4 @@
 // We request posix_close if available. See the comment on "robust_close".
+#ifndef __FreeBSD__
 #define _POSIX_C_SOURCE 202405L
+#endif
