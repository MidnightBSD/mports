--- sources/lplib3.c.orig	2021-07-23 10:27:28 UTC
+++ sources/lplib3.c
@@ -30,6 +30,9 @@
 #include <assert.h>
 #include <errno.h>
 #include <unistd.h>
+#ifdef __FreeBSD__
+#include <pmc.h>
+#endif
 #include "lplib3.h"


@@ -1253,0 +1257,1 @@ void qsort_mt(void *a, size_t n, size_t es, cmp_t *cmp
+		uint32_t ncpu;
