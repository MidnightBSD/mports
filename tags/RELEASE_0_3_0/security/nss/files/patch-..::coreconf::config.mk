--- ../coreconf/config.mk.orig	2010-10-30 15:50:01 -0400
+++ ../coreconf/config.mk	2010-10-30 15:50:21 -0400
@@ -62,7 +62,7 @@
 #       one for each OS release.                                      #
 #######################################################################
 
-TARGET_OSES = FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
+TARGET_OSES = FreeBSD BSD_OS MidnightBSD NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
               AIX RISCOS WINNT WIN95 WINCE
 
 ifeq (,$(filter-out $(TARGET_OSES),$(OS_TARGET)))
