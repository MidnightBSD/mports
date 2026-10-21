    need signal.h for signal stuff on FreeBSD

--- xpcom/base/nsMemoryInfoDumper.cpp.orig	2025-06-01 18:00:00 UTC
+++ xpcom/base/nsMemoryInfoDumper.cpp
@@ -42,6 +42,9 @@

 #if defined(MOZ_SUPPORTS_RT_SIGNALS)
 #  include <fcntl.h>
+#if defined(__FreeBSD__)
+#  include <signal.h>
+#endif
 #  include <sys/types.h>
 #  include <sys/stat.h>
 #endif
