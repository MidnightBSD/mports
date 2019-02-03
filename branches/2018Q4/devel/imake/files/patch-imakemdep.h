--- imakemdep.h.orig	2013-08-17 06:11:06.000000000 -0400
+++ imakemdep.h	2015-09-08 21:38:58.150230168 -0400
@@ -301,7 +301,7 @@
 #   if defined(__386BSD__)
 #    define DEFAULT_CPP "/usr/libexec/cpp"
 #   endif
-#   if defined(__FreeBSD__)  || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
+#   if defined(__FreeBSD__)  || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 #    define USE_CC_E
 #   endif
 #   if defined(__sgi) && defined(__ANSI_CPP__)
@@ -361,11 +361,12 @@
 #   endif
 #   if defined(__386BSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || \
     defined(__FreeBSD__) || defined(__DragonFly__) || defined(MACH) || \
+    defined(__MidnightBSD__) || \
     defined(linux) || defined(__GNU__) || defined(__bsdi__) || \
     defined(__GNUC__) || defined(__GLIBC__)
 #    ifdef __i386__
 	"-D__i386__",
-#     if defined(__GNUC__) && (__GNUC__ >= 3)
+#     if defined(__GNUC__) && (__GNUC__ >= 3) && !defined(__FreeBSD__) && !defined(__MidnightBSD__)
 	"-m32",
 #     endif
 #    endif
@@ -839,14 +840,14 @@
 #    define DEFAULT_OS_MINOR_REV   "r %*d.%[0-9]"
 #    define DEFAULT_OS_TEENY_REV   "v %[0-9]"
 /* # define DEFAULT_OS_NAME        "srm %[^\n]" */ /* Not useful on ISC */
-#   elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__OpenBSD__) || defined(__DragonFly__)
+#   elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /* BSD/OS too? */
 /* uname -r returns "x.y[.z]-mumble", e.g. "2.1.5-RELEASE" or "2.2-0801SNAP" */
 #    define DEFAULT_OS_MAJOR_REV   "r %[0-9]"
 #    define DEFAULT_OS_MINOR_REV   "r %*d.%[0-9]"
 #    define DEFAULT_OS_TEENY_REV   "r %*d.%*d.%[0-9]"
 #    define DEFAULT_OS_NAME        "srm %[^\n]"
-#    if defined(__FreeBSD__) || defined(__DragonFly__)
+#    if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /* Use an alternate way to find the teeny version for -STABLE, -SNAP versions */
 #     ifndef CROSSCOMPILE_CPP
 #      define DEFAULT_OS_TEENY_REV_FROB(buf, size)			\
@@ -1281,6 +1282,9 @@
 #   ifdef __DragonFly__
 	{"__DragonFly__", "1"},
 #   endif
+#   ifdef __MidnightBSD__
+	{"__MidnightBSD__", "1"}, 
+#   endif
 #   ifdef __FreeBSD__
 	{"__FreeBSD__", "1"},
 #   endif
@@ -1466,13 +1470,16 @@
   LinuX,
   emx,
   win32,
-  dragonfly
+  dragonfly,
+  midnightbsd
 } System;
 
 #   if defined(linux) || defined(__GLIBC__)
 System sys = LinuX;
 #   elif defined __FreeBSD__
 System sys = freebsd;
+#   elif defined __MidnightBSD__
+System sys = freebsd;
 #   elif defined __NetBSD__
 System sys = netBSD;
 #   elif defined __EMX__
