--- clean_os.sh.orig	2020-04-05 14:59:54 UTC
+++ clean_os.sh
@@ -31,6 +31,11 @@ case "$1" in
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
