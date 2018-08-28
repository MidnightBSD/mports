--- coreconf/config.mk.orig	2013-07-15 21:55:47.000000000 -0400
+++ coreconf/config.mk	2013-07-15 21:56:08.000000000 -0400
@@ -30,7 +30,7 @@
 #       one for each OS release.                                      #
 #######################################################################
 
-TARGET_OSES = FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
+TARGET_OSES = MidnightBSD FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
               AIX RISCOS WINNT WIN95 Linux Android
 
 ifeq (,$(filter-out $(TARGET_OSES),$(OS_TARGET)))
