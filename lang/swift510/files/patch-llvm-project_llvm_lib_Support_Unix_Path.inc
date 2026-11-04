--- llvm-project/llvm/lib/Support/Unix/Path.inc.orig	2024-05-24 18:46:43 UTC
+++ llvm-project/llvm/lib/Support/Unix/Path.inc
@@ -44,6 +44,11 @@
 #endif
 #elif defined(__FreeBSD__)
 #include <osreldate.h>
+#if defined(__MidnightBSD__)
+// On MidnightBSD <osreldate.h> only defines __MidnightBSD_version;
+// __FreeBSD_version comes from <sys/param.h>.
+#include <sys/param.h>
+#endif
 #if __FreeBSD_version >= 1300057
 #include <sys/auxv.h>
 #else
