--- security/coreconf/config.mk.orig	2009-02-13 12:14:05 -0500
+++ security/coreconf/config.mk	2009-10-12 22:29:39 -0400
@@ -63,7 +63,7 @@
 #######################################################################
 
 TARGET_OSES = FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
-              OpenVMS AIX RISCOS WINNT WIN95 WINCE
+              MIdnightBSD OpenVMS AIX RISCOS WINNT WIN95 WINCE
 
 ifeq (,$(filter-out $(TARGET_OSES),$(OS_TARGET)))
 include $(CORE_DEPTH)/coreconf/$(OS_TARGET).mk
