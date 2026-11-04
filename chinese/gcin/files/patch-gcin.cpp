--- gcin.cpp.orig
+++ gcin.cpp
@@ -584,7 +584,7 @@
   if (getenv("GCIN_DAEMON")) {
     daemon(1,1);
 #if FREEBSD
     setpgid(0, getpid());
 #else
-    setpgrp();
+    setpgid(0, getpid());
 #endif
   }
 #endif
