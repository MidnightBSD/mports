--- base/rand_util.h.orig	2026-10-26 21:13:13 UTC
+++ base/rand_util.h
@@ -219,7 +219,7 @@
   return r[base::RandGenerator(r.size())];
 }
 
-#if BUILDFLAG(IS_POSIX) && !BUILDFLAG(IS_APPLE)
+#if BUILDFLAG(IS_POSIX) && !BUILDFLAG(IS_APPLE) && !BUILDFLAG(IS_BSD)
 BASE_EXPORT int GetUrandomFD();
 #endif
 
