--- usr/local/share/bastille/verify.sh.orig	2021-02-26 20:58:07 UTC
+++ usr/local/share/bastille/verify.sh
@@ -37,6 +37,10 @@ bastille_usage() {
 }
 
 verify_release() {
+    if [ -f /bin/midnightbsd-version ]; then
+        echo -e "${COLOR_RED}Not yet supported on MidnightBSD.${COLOR_RESET}"
+        exit 1
+    fi
     if freebsd-version | grep -qi HBSD; then
         echo -e "${COLOR_RED}Not yet supported on HardenedBSD.${COLOR_RESET}"
         exit 1
