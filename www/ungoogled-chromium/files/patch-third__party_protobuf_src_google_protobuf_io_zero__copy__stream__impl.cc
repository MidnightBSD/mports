--- third_party/protobuf/src/google/protobuf/io/zero_copy_stream_impl.cc.orig	2026-10-26 21:13:14 UTC
+++ third_party/protobuf/src/google/protobuf/io/zero_copy_stream_impl.cc
@@ -10,7 +10,9 @@
 //  Sanjay Ghemawat, Jeff Dean, and others.
 
 // We request posix_close if available. See the comment on "robust_close".
+#if !defined(__FreeBSD__) && !defined(__MidnightBSD__)
 #define _POSIX_C_SOURCE 202405L
+#endif
 
 #ifndef _MSC_VER
 #include <fcntl.h>
