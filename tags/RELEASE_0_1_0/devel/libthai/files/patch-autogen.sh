--- autogen.sh.orig	Fri Nov 24 13:47:29 2006
+++ autogen.sh	Fri Nov 24 13:47:40 2006
@@ -4,7 +4,7 @@
 srcdir=`dirname $0`
 PKG_NAME="libthai"
 
-if test `uname` = "FreeBSD"; then
+if test `uname` = "MidnightBSD"; then
     autoconf="autoconf259"
     automake="automake15"
     aclocal="aclocal15"
