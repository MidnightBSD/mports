--- xpcom/reflect/xptcall/src/md/unix/xptc_platforms_unixish_x86.h.orig	Fri Oct 19 02:53:22 2007
+++ xpcom/reflect/xptcall/src/md/unix/xptc_platforms_unixish_x86.h	Fri Oct 19 02:54:01 2007
@@ -77,7 +77,7 @@
 #define THUNK_BASED_THIS_ADJUST
 #endif
 
-#elif defined(__FreeBSD__) 
+#elif defined(__FreeBSD__) || defined(__MidnightBSD__)
 /* System versions of gcc on FreeBSD don't use thunks.  On 3.x, the system
  * compiler is gcc 2.7.2.3, which doesn't use thunks by default.  On 4.x and
  * 5.x, /usr/src/contrib/gcc/config/freebsd.h explicitly undef's
