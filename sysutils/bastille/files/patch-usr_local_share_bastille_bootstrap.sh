--- usr/local/share/bastille/bootstrap.sh.orig	2021-01-15 22:31:11.000000000 -0500
+++ usr/local/share/bastille/bootstrap.sh	2021-02-27 14:41:36.423993000 -0500
@@ -363,6 +363,13 @@
 
 ## Filter sane release names
 case "${1}" in
+2.[0-9]*)
+    ## check for MidnightBSD releases name
+    NAME_VERIFY=$(echo ${RELEASE})
+    UPSTREAM_URL="${bastille_url_midnightbsd}${HW_MACHINE_ARCH}/${NAME_VERIFY}"
+    PLATFORM_OS="MidnightBSD"
+    validate_release_url
+    ;;
 *-CURRENT|*-current)
     ## check for FreeBSD releases name
     NAME_VERIFY=$(echo "${RELEASE}" | grep -iwE '^([1-9]{2,2})\.[0-9](-CURRENT)$' | tr '[:lower:]' '[:upper:]')
