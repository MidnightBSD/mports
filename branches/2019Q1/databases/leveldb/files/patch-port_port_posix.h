--- port/port_posix.h.bak	2017-03-01 19:08:02.000000000 -0500
+++ port/port_posix.h	2018-09-26 19:53:23.178008000 -0400
@@ -22,7 +22,7 @@
     #define PLATFORM_IS_LITTLE_ENDIAN false
   #endif
 #elif defined(OS_FREEBSD) || defined(OS_OPENBSD) ||\
-      defined(OS_NETBSD) || defined(OS_DRAGONFLYBSD)
+      defined(OS_NETBSD) || defined(OS_DRAGONFLYBSD) || defined(OS_MIDNIGHTBSD)
   #include <sys/types.h>
   #include <sys/endian.h>
   #define PLATFORM_IS_LITTLE_ENDIAN (_BYTE_ORDER == _LITTLE_ENDIAN)
@@ -47,12 +47,12 @@
 #include "port/atomic_pointer.h"
 
 #ifndef PLATFORM_IS_LITTLE_ENDIAN
-#define PLATFORM_IS_LITTLE_ENDIAN (__BYTE_ORDER == __LITTLE_ENDIAN)
+#define PLATFORM_IS_LITTLE_ENDIAN (_BYTE_ORDER == _LITTLE_ENDIAN)
 #endif
 
 #if defined(OS_MACOSX) || defined(OS_SOLARIS) || defined(OS_FREEBSD) ||\
     defined(OS_NETBSD) || defined(OS_OPENBSD) || defined(OS_DRAGONFLYBSD) ||\
-    defined(OS_ANDROID) || defined(OS_HPUX) || defined(CYGWIN)
+    defined(OS_ANDROID) || defined(OS_HPUX) || defined(CYGWIN) || defined(OS_MIDNIGHTBSD)
 // Use fread/fwrite/fflush on platforms without _unlocked variants
 #define fread_unlocked fread
 #define fwrite_unlocked fwrite
@@ -60,7 +60,7 @@
 #endif
 
 #if defined(OS_MACOSX) || defined(OS_FREEBSD) ||\
-    defined(OS_OPENBSD) || defined(OS_DRAGONFLYBSD)
+    defined(OS_OPENBSD) || defined(OS_DRAGONFLYBSD) || defined(OS_MIDNIGHTBSD)
 // Use fsync() on platforms without fdatasync()
 #define fdatasync fsync
 #endif
