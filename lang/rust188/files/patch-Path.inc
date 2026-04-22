--- ./src/llvm-project/llvm/lib/Support/Unix/Path.inc.orig	2025-11-28 16:49:15.298802000 -0500
+++ ./src/llvm-project/llvm/lib/Support/Unix/Path.inc	2025-11-28 16:49:35.347530000 -0500
@@ -35,27 +35,8 @@
 #include <pwd.h>
 #include <sys/file.h>
 
-#ifdef __APPLE__
-#include <copyfile.h>
-#include <mach-o/dyld.h>
-#include <sys/attr.h>
-#if __has_include(<sys/clonefile.h>)
-#include <sys/clonefile.h>
-#endif
-#elif defined(__FreeBSD__)
 #include <osreldate.h>
-#if __FreeBSD_version >= 1300057
 #include <sys/auxv.h>
-#else
-#include <machine/elf.h>
-extern char **environ;
-#endif
-#elif defined(__DragonFly__)
-#include <sys/mount.h>
-#elif defined(__MVS__)
-#include "llvm/Support/AutoConvert.h"
-#include <sys/ps.h>
-#endif
 
 // Both stdio.h and cstdio are included via different paths and
 // stdcxx's cstdio doesn't include stdio.h, so it doesn't #undef the macros
