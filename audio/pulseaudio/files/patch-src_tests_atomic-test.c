--- src/tests/atomic-test.c.orig	2024-01-12 17:22:09 UTC
+++ src/tests/atomic-test.c
@@ -54,6 +54,11 @@
 
 #define MEMORY_SIZE (8 * 2 * 1024 * 1024)
 
+#ifdef __FreeBSD__
+#include <sys/cpuset.h>
+#define cpu_set_t cpuset_t
+#endif
+
 
 typedef struct io_t {
    pa_atomic_t *flag;
