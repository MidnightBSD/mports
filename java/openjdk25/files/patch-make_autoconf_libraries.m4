--- make/autoconf/libraries.m4.orig
+++ make/autoconf/libraries.m4
@@ -75,7 +75,7 @@
   fi
 
   # Check if alsa is needed
-  if test "x$OPENJDK_TARGET_OS" = xlinux || test "x$OPENJDK_TARGET_OS_ENV" = xbsd.freebsd || test "x$OPENJDK_TARGET_OS_ENV" = xbsd.netbsd; then
+  if test "x$OPENJDK_TARGET_OS" = xlinux || test "x$OPENJDK_TARGET_OS" = xbsd; then
     NEEDS_LIB_ALSA=true
   else
     NEEDS_LIB_ALSA=false
@@ -188,9 +188,9 @@
       ICONV_LDFLAGS="-L/usr/local/lib"
       ICONV_LIBS=-liconv
     elif test "x$OPENJDK_TARGET_OS_ENV" = "xbsd.freebsd"; then
-      ICONV_CFLAGS=-DLIBICONV_PLUG
-      ICONV_LDFLAGS=
-      ICONV_LIBS=
+      ICONV_CFLAGS=%%ICONV_CFLAGS%%
+      ICONV_LDFLAGS=%%ICONV_LDFLAGS%%
+      ICONV_LIBS=%%ICONV_LIBS%%
     else
       ICONV_CFLAGS=
       ICONV_LDFLAGS=
