--- autogen.sh.orig	Sun Jul 27 23:28:16 2008
+++ autogen.sh	Sun Jul 27 23:28:55 2008
@@ -16,4 +16,3 @@
 
 # don't use any old cache, but create a new one
 rm -f config.cache
-./configure -C "$@"
