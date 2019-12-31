--- client/hostinfo_unix.cpp.orig	2018-01-14 05:07:52.000000000 -0500
+++ client/hostinfo_unix.cpp	2019-11-02 14:58:37.837999000 -0400
@@ -398,7 +398,7 @@
     }
 
     return false;
-#elif defined(__FreeBSD__)
+#elif defined(__FreeBSD__) || defined(__MidnightBSD__)
     int ac;
     size_t len = sizeof(ac);
 
@@ -714,7 +714,7 @@
     fclose(f);
 }
 #endif  // LINUX_LIKE_SYSTEM
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #if defined(__i386__) || defined(__amd64__)
 #include <sys/types.h>
 #include <sys/cdefs.h>
@@ -1393,7 +1393,7 @@
 #error Need to specify a method to get p_vendor, p_model
 #endif
 
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #if defined(__i386__) || defined(__amd64__)
     use_cpuid(*this);
 #endif
