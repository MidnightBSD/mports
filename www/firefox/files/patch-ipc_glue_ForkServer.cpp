    we need signal.h and BinaryPath.h

--- ipc/glue/ForkServer.cpp.orig	2025-06-01 18:00:00 UTC
+++ ipc/glue/ForkServer.cpp
@@ -22,12 +22,15 @@
 #include <string.h>
 #include <sys/wait.h>
 #include <unistd.h>
+#if defined(XP_FREEBSD)
+#include <signal.h>
+#endif

 #if defined(XP_LINUX) && defined(MOZ_SANDBOX)
 #  include "mozilla/SandboxLaunch.h"
 #endif

-#if defined(XP_OPENBSD)
+#if defined(XP_OPENBSD) || defined(XP_FREEBSD)
 #  include "BinaryPath.h"
 #  include <err.h>
 #endif
@@ -79,7 +82,7 @@ static void ForkServerPreload(int& aArgc, char** aArgv) {
   Omnijar::ChildProcessInit(aArgc, aArgv);
-#if defined(XP_OPENBSD)
+#if defined(XP_OPENBSD) || defined(XP_FREEBSD)
   char binaryPath[MAXPATHLEN];
   nsresult rv = mozilla::BinaryPath::Get(binaryPath);
   if (NS_FAILED(rv)) {
