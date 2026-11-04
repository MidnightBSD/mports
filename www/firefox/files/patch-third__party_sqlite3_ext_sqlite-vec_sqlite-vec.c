--- third_party/sqlite3/ext/sqlite-vec/sqlite-vec.c.orig	2025-06-01 18:00:00 UTC
+++ third_party/sqlite3/ext/sqlite-vec/sqlite-vec.c
@@ -9,6 +9,10 @@
 #include <stdlib.h>
 #include <string.h>

+#ifdef __FreeBSD__
+#include <sys/types.h>
+#endif
+
 #ifdef SQLITE_VEC_DEBUG
 #include <stdio.h>
 #endif
