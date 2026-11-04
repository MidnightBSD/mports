--- storage/rocksdb/rocksdb/port/jemalloc_helper.h.orig	2026-10-03 00:00:00 UTC
+++ storage/rocksdb/rocksdb/port/jemalloc_helper.h
@@ -26,0 +27,4 @@
+#endif
+
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+#define JEMALLOC_USABLE_SIZE_CONST const
