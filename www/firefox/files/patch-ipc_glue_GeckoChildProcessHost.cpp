--- ipc/glue/GeckoChildProcessHost.cpp.orig	2025-06-01 18:00:00 UTC
+++ ipc/glue/GeckoChildProcessHost.cpp
@@ -1127,7 +1127,7 @@ Result<Ok, LaunchError> BaseProcessLauncher::DoSetup() {
 #if defined(MOZ_WIDGET_COCOA) || defined(XP_WIN)
     geckoargs::sCrashReporter.Put(CrashReporter::GetChildNotificationPipe(),
                                   mChildArgs);
-#elif defined(XP_UNIX) && !defined(XP_IOS)
+#elif defined(XP_UNIX) && !defined(XP_IOS) && !defined(XP_FREEBSD)
     UniqueFileHandle childCrashFd = CrashReporter::GetChildNotificationPipe();
     if (!childCrashFd) {
       return Err(LaunchError("DuplicateFileHandle failed"));
