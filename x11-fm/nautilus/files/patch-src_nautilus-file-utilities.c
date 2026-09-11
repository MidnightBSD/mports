--- src/nautilus-file-utilities.c.orig
+++ src/nautilus-file-utilities.c
@@ -41,4 +41,8 @@
 #include <gio/gio.h>
 #include <unistd.h>
 #include <stdlib.h>
+#ifdef __FreeBSD__
+#include <sys/mount.h>
+#else
 #include <sys/vfs.h>
+#endif
