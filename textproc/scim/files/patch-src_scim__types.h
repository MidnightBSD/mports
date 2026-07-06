--- src/scim_types.h.orig	2007-04-10 09:18:27 UTC
+++ src/scim_types.h
@@ -31,7 +31,7 @@
 
 #include <stdint.h>
 
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 # include <osreldate.h>
 # if __FreeBSD_version > 500035
 #  define __STDC_ISO_10646__
