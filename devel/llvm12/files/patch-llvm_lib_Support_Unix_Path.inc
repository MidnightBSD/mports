--- llvm/lib/Support/Unix/Path.inc.orig	2025-12-29 23:54:57.508693000 -0500
+++ llvm/lib/Support/Unix/Path.inc	2025-12-29 23:55:33.556515000 -0500
@@ -35,23 +35,13 @@
 #include <pwd.h>
 #include <sys/file.h>
 
-#ifdef __APPLE__
-#include <mach-o/dyld.h>
-#include <sys/attr.h>
-#include <copyfile.h>
-#elif defined(__FreeBSD__)
 #include <osreldate.h>
-#if __FreeBSD_version >= 1300057
+#if __MidnightBSD_version >= 400000
 #include <sys/auxv.h>
 #else
 #include <machine/elf.h>
 extern char **environ;
 #endif
-#elif defined(__DragonFly__)
-#include <sys/mount.h>
-#elif defined(__MVS__)
-#include <sys/ps.h>
-#endif
 
 // Both stdio.h and cstdio are included via different paths and
 // stdcxx's cstdio doesn't include stdio.h, so it doesn't #undef the macros
