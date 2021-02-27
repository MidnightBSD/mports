--- usr/local/share/bastille/create.sh.orig	2020-07-14 03:49:31 UTC
+++ usr/local/share/bastille/create.sh
@@ -458,6 +458,11 @@ fi
 if [ -z "${EMPTY_JAIL}" ]; then
     ## verify release
     case "${RELEASE}" in
+    2.[0-9]*)
+        ## check for MidnightBSD releases name
+        NAME_VERIFY=$(echo "${RELEASE}")
+        validate_release
+        ;;
     *-RELEASE|*-release|*-RC1|*-rc1|*-RC2|*-rc2)
         ## check for FreeBSD releases name
         NAME_VERIFY=$(echo "${RELEASE}" | grep -iwE '^([1-9]{2,2})\.[0-9](-RELEASE|-RC[1-2])$' | tr '[:lower:]' '[:upper:]')
