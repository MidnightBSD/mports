--- usr/local/share/bastille/pkg.sh.orig	2021-02-26 20:53:54 UTC
+++ usr/local/share/bastille/pkg.sh
@@ -58,6 +58,9 @@ fi
 
 for _jail in ${JAILS}; do
     echo -e "${COLOR_GREEN}[${_jail}]:${COLOR_RESET}"
-    jexec -l "${_jail}" /usr/sbin/pkg "$@"
+    if [ -f ${_jail}/usr/sbin/pkg ]; then
+        jexec -l "${_jail}" /usr/sbin/pkg "$@"
+    else
+        jexec -l "${_jail}" /usr/sbin/mport "$@"
     echo
 done
