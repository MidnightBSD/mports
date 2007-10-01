--- ../coreconf/config.mk.orig	Tue Sep 19 20:00:58 2006
+++ ../coreconf/config.mk	Tue Sep 19 20:01:06 2006
@@ -62,7 +62,7 @@
 #       one for each OS release.                                      #
 #######################################################################
 
-TARGET_OSES = FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
+TARGET_OSES = FreeBSD MidnightBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
               OpenVMS AIX
 
 ifeq (,$(filter-out $(TARGET_OSES),$(OS_TARGET)))
