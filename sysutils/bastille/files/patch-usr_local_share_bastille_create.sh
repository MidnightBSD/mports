--- usr/local/share/bastille/create.sh.orig	2021-01-15 22:31:11.000000000 -0500
+++ usr/local/share/bastille/create.sh	2021-02-27 14:42:59.388079000 -0500
@@ -481,6 +481,11 @@
 if [ -z "${EMPTY_JAIL}" ]; then
     ## verify release
     case "${RELEASE}" in
+    2.[0-9]*)
+        ## check for MidnightBSD releases name
+        NAME_VERIFY=$(echo "${RELEASE}")
+        validate_release
+        ;;
     *-CURRENT|*-CURRENT-I386|*-CURRENT-i386|*-current)
         ## check for FreeBSD releases name
         NAME_VERIFY=$(echo "${RELEASE}" | grep -iwE '^([1-9]{2,2})\.[0-9](-CURRENT|-CURRENT-i386)$' | tr '[:lower:]' '[:upper:]' | sed 's/I/i/g')
