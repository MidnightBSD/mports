--- usr/local/share/bastille/bootstrap.sh.orig	2020-07-14 03:49:31 UTC
+++ usr/local/share/bastille/bootstrap.sh
@@ -340,6 +340,13 @@ RELEASE="${1}"
 
 ## Filter sane release names
 case "${1}" in
+2.[0-9]*)
+    ## check for MidnightBSD releases name
+    NAME_VERIFY=$(echo ${RELEASE})
+    UPSTREAM_URL="${bastille_url_midnightbsd}${HW_MACHINE_ARCH}/${NAME_VERIFY}"
+    PLATFORM_OS="MidnightBSD"
+    validate_release_url
+    ;;
 *-RELEASE|*-release|*-RC1|*-rc1|*-RC2|*-rc2)
     ## check for FreeBSD releases name
     NAME_VERIFY=$(echo "${RELEASE}" | grep -iwE '^([1-9]{2,2})\.[0-9](-RELEASE|-RC[1-2])$' | tr '[:lower:]' '[:upper:]')
