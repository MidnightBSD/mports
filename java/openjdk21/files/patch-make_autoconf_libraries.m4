--- make/autoconf/libraries.m4.orig
+++ make/autoconf/libraries.m4
@@ -75,7 +75,7 @@
   fi
 
   # Check if alsa is needed
-  if test "x$OPENJDK_TARGET_OS" = xlinux -o "x$OPENJDK_TARGET_OS_ENV" = xbsd.freebsd -o "x$OPENJDK_TARGET_OS_ENV" = xbsd.netbsd; then
+  if test "x$OPENJDK_TARGET_OS" = xlinux -o "x$OPENJDK_TARGET_OS" = xbsd; then
     NEEDS_LIB_ALSA=true
   else
     NEEDS_LIB_ALSA=false
