--- usr/local/share/bastille/create.sh.orig	2025-05-31 16:20:39 UTC
+++ usr/local/share/bastille/create.sh
@@ -857,7 +857,7 @@ if [ -z "${EMPTY_JAIL}" ]; then
     if [ -n "${VALIDATE_RELEASE}" ]; then
         ## verify release
         case "${RELEASE}" in
-        2.[0-9]*)
+        [2-4].[0-9]*)
             ## check for MidnightBSD releases name
             NAME_VERIFY=$(echo "${RELEASE}")
             validate_release
