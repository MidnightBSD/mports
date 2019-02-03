--- mkdirs.sh.orig	2015-08-22 12:35:02.688167729 -0400
+++ mkdirs.sh	2015-08-22 12:35:11.907167435 -0400
@@ -8,6 +8,6 @@
 mkdir ${PROGDIR}/inmates >/dev/null 2>/dev/null
 mkdir ${PROGDIR}/export >/dev/null 2>/dev/null
 
-ln -fs /usr/ports ${PROGDIR}/ports
+ln -fs /usr/mports ${PROGDIR}/ports
 
 exit 0
