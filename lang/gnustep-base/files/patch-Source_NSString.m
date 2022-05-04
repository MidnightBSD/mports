--- Source/NSString.m.orig	2022-05-03 20:04:16 UTC
+++ Source/NSString.m
@@ -5115,7 +5115,7 @@ static NSFileManager *fm = nil;
 #else
 
 {
-  #if defined(__GLIBC__) || defined(__FreeBSD__)
+  #if defined(__GLIBC__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
   #define GS_MAXSYMLINKS sysconf(_SC_SYMLOOP_MAX)
   #else
   #define GS_MAXSYMLINKS MAXSYMLINKS
