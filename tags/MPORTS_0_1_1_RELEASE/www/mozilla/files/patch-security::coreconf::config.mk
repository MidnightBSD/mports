--- security/coreconf/config.mk.orig	Tue Mar 13 12:13:04 2007
+++ security/coreconf/config.mk	Tue Mar 13 12:13:14 2007
@@ -59,7 +59,7 @@
 #######################################################################
 
 TARGET_OSES = FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
-              OpenVMS AIX
+              OpenVMS AIX MidnightBSD
 
 ifeq (,$(filter-out $(TARGET_OSES),$(OS_TARGET)))
 include $(CORE_DEPTH)/coreconf/$(OS_TARGET).mk
