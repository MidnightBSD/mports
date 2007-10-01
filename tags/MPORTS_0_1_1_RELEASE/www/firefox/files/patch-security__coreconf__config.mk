--- security/coreconf/config.mk.orig	Thu Apr 27 23:36:22 2006
+++ security/coreconf/config.mk	Mon May  7 21:46:51 2007
@@ -63,7 +63,7 @@
 #######################################################################
 
 TARGET_OSES = FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
-              OpenVMS AIX
+              OpenVMS AIX MidnightBSD
 
 ifeq (,$(filter-out $(TARGET_OSES),$(OS_TARGET)))
 include $(CORE_DEPTH)/coreconf/$(OS_TARGET).mk
