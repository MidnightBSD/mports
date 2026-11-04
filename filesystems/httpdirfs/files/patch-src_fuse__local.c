--- src/fuse_local.c.orig
+++ src/fuse_local.c
@@ -45,4 +45,4 @@
 #endif
 
-#define FUSE_USE_VERSION 30
-#include <fuse.h>
+#define FUSE_USE_VERSION 35
+#include <fuse3/fuse.h>
