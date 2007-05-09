--- security/coreconf/config.mk.orig	Tue May  8 16:24:14 2007
+++ security/coreconf/config.mk	Tue May  8 16:24:46 2007
@@ -63,7 +63,7 @@
 #######################################################################
 
 TARGET_OSES = FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
-              OpenVMS AIX
+              OpenVMS AIX MidnightBSD
 
 ifeq (,$(filter-out $(TARGET_OSES),$(OS_TARGET)))
 include $(CORE_DEPTH)/coreconf/$(OS_TARGET).mk
