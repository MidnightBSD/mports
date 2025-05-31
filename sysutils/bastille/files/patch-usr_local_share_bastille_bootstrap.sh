--- usr/local/share/bastille/bootstrap.sh.orig	2025-05-31 16:07:49 UTC
+++ usr/local/share/bastille/bootstrap.sh
@@ -501,7 +501,7 @@ fi
 
 ## Filter sane release names
 case "${1}" in
-    2.[0-9]*)
+    [2-4].[0-9]*)
         ## check for MidnightBSD releases name
         NAME_VERIFY=$(echo "${RELEASE}")
         UPSTREAM_URL="${bastille_url_midnightbsd}${HW_MACHINE_ARCH}/${NAME_VERIFY}"
