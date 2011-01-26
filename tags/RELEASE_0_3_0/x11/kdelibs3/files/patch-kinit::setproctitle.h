--- kinit/setproctitle.h.orig	2009-06-29 18:37:01 -0400
+++ kinit/setproctitle.h	2009-06-29 18:38:00 -0400
@@ -76,16 +76,12 @@
 #  undef SPT_TYPE
 #  define SPT_TYPE      SPT_BUILTIN     /* setproctitle is in libc */
 # endif
-# if defined(__FreeBSD__)
+# if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #  undef SPT_TYPE
-#  if __FreeBSD__ >= 2
 #   include <osreldate.h>
-#   if __FreeBSD_version >= 199512      /* 2.2-current when it appeared */
 #    include <sys/types.h>
 #    include <libutil.h>
 #    define SPT_TYPE    SPT_BUILTIN
-#   endif
-#  endif
 #  ifndef SPT_TYPE
 #   define SPT_TYPE     SPT_REUSEARGV
 #   define SPT_PADCHAR  '\0'            /* pad process title with nulls */
