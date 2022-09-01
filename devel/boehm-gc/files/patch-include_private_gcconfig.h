--- include/private/gcconfig.h.orig	2022-09-01 06:09:00 UTC
+++ include/private/gcconfig.h
@@ -232,7 +232,7 @@ EXTERN_C_BEGIN
 #      define EWS4800
 #    endif
 #    if !defined(LINUX) && !defined(EWS4800) && !defined(NETBSD) \
-        && !defined(OPENBSD)
+        && !defined(OPENBSD) && !defined(FREEBSD)
 #      if defined(ultrix) || defined(__ultrix)
 #        define ULTRIX
 #      else
