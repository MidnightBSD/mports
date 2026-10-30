--- third_party/dawn/src/dawn/common/DRMUtils.cpp.orig	2026-10-26 21:13:13 UTC
+++ third_party/dawn/src/dawn/common/DRMUtils.cpp	2026-10-29 03:54:49 UTC
@@ -30,7 +30,11 @@
 #include <dirent.h>
 #include <fcntl.h>
 #include <sys/stat.h>
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+#include <sys/types.h>
+#else
 #include <sys/sysmacros.h>
+#endif
 
 #include <algorithm>
 #include <cctype>
