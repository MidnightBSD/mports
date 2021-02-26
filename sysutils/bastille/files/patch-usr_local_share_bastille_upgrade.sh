--- usr/local/share/bastille/upgrade.sh.orig	2021-02-26 20:58:00 UTC
+++ usr/local/share/bastille/upgrade.sh
@@ -51,6 +51,11 @@ RELEASE="$1"
 shift
 NEWRELEASE="$1"
 
+if [ -f /bin/midnightbsd-version ]; then 
+    echo -e "${COLOR_RED}Not yet supported on MidnightBSD.${COLOR_RESET}"
+    exit 1
+fi  
+
 if freebsd-version | grep -qi HBSD; then
     echo -e "${COLOR_RED}Not yet supported on HardenedBSD.${COLOR_RESET}"
     exit 1
