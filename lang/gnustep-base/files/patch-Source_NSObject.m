--- Source/NSObject.m.orig	2022-06-09 15:13:24.211458000 -0400
+++ Source/NSObject.m	2022-06-09 15:14:10.871109000 -0400
@@ -66,7 +66,7 @@
 #endif
 
 #if __GNUC__ >= 4
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #include <fenv.h>
 #endif
 #endif // __GNUC__
@@ -1031,7 +1031,7 @@
       finalize_sel = @selector(finalize);
       finalize_imp = class_getMethodImplementation(self, finalize_sel);
 
-#if defined(__FreeBSD__) && defined(__i386__)
+#if (defined(__MidnightBSD__) || defined(__FreeBSD__)) && defined(__i386__)
       // Manipulate the FPU to add the exception mask. (Fixes SIGFPE
       // problems on *BSD)
       // Note this only works on x86
