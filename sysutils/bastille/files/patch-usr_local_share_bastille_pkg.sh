--- usr/local/share/bastille/pkg.sh.orig	2021-01-15 22:31:11.000000000 -0500
+++ usr/local/share/bastille/pkg.sh	2021-02-27 14:44:20.981109000 -0500
@@ -48,5 +48,10 @@
 for _jail in ${JAILS}; do
     info "[${_jail}]:"
     jexec -l "${_jail}" /usr/sbin/pkg "$@"
+    if [ -f /usr/sbin/pkg ]; then
+        jexec -l "${_jail}" /usr/sbin/pkg "$@"
+    else
+        jexec -l "${_jail}" /usr/sbin/mport "$@"
+    fi
     echo
 done
