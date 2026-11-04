--- storage/rocksdb/rocksdb/port/jemalloc_helper.h.orig	2020-06-23 15:10:17 UTC
+++ storage/rocksdb/rocksdb/port/jemalloc_helper.h
@@ -26,6 +26,10 @@
 #include <jemalloc/jemalloc.h>
 #endif
 
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+#define JEMALLOC_USABLE_SIZE_CONST const
+#endif
+
 #ifndef JEMALLOC_CXX_THROW
 #define JEMALLOC_CXX_THROW
 #endif
