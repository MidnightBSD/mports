--- install.sh.orig	Tue Aug 21 15:51:41 2007
+++ install.sh	Tue Aug 21 15:52:41 2007
@@ -1,6 +1,7 @@
 #!/bin/sh
 
-INSTALLDIR=`grep INSTALLDIR config.h | awk -F\" '{ print $2 }'`
+#INSTALLDIR=`grep INSTALLDIR config.h | awk -F\" '{ print $2 }'`
+INSTALLDIR=${PREFIX}
 if test "$INSTALLDIR" = ""; then
 	INSTALLDIR="/usr/local"
 fi
