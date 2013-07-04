--- kBuild/env.sh.orig	2009-06-03 22:20:32 -0400
+++ kBuild/env.sh	2009-06-03 22:21:36 -0400
@@ -268,6 +268,10 @@
             KBUILD_HOST=linux
             ;;
 
+        MidnightBSD)
+            KBUILD_HOST=freebsd
+            ;;
+
         netbsd|NetBSD|NETBSD)
             KBUILD_HOST=netbsd
             ;;
