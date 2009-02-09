--- clean_os.sh.orig	2009-02-09 01:54:41 -0500
+++ clean_os.sh	2009-02-09 01:55:17 -0500
@@ -31,6 +31,11 @@
 	echo freebsd
 	exit 0
 	;;
+    # Remove version number for MidnightBSD
+    midnightbsd*)
+        echo midnightbsd
+        exit 0
+        ;;
     # Remove version number for Darwin
     # Versions currently most common have a quick hardcoded lookup
     darwin9*)
