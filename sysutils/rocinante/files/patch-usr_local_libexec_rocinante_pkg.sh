--- usr/local/libexec/rocinante/pkg.sh.orig	2025-06-09 19:37:07 UTC
+++ usr/local/libexec/rocinante/pkg.sh
@@ -48,5 +48,9 @@ fi
 
 ## execute PKG
 info "[PKG]:"
+if [ -f "/usr/sbin/mport" ]; then
+/usr/sbin/mport "$@"
+else
 /usr/sbin/pkg "$@"
+fi
 echo -e "${COLOR_RESET}"
