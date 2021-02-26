--- usr/local/share/bastille/update.sh.orig	2021-02-26 20:57:54 UTC
+++ usr/local/share/bastille/update.sh
@@ -50,6 +50,11 @@ fi
 TARGET="${1}"
 shift
 
+if [ -f /bin/midnightbsd-version ]; then 
+    echo -e "${COLOR_RED}Not yet supported on MidnightBSD.${COLOR_RESET}"
+    exit 1
+fi  
+
 if freebsd-version | grep -qi HBSD; then
     echo -e "${COLOR_RED}Not yet supported on HardenedBSD.${COLOR_RESET}"
     exit 1
