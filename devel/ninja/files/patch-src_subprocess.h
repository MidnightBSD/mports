--- src/subprocess.h.orig	2022-09-08 13:13:12 UTC
+++ src/subprocess.h
@@ -33,6 +33,14 @@
 #  endif
 #endif
 
+#ifdef __MidnightBSD__
+#  include <sys/param.h>
+#  if defined USE_PPOLL && __MidnightBSD_version < 200000
+#    undef USE_PPOLL
+#  endif
+#endif
+
+
 #include "exit_status.h"
 
 /// Subprocess wraps a single async subprocess.  It is entirely
