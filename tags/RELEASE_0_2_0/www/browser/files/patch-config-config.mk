--- config/config.mk.orig	Fri Oct 19 20:51:11 2007
+++ config/config.mk	Fri Oct 19 20:51:29 2007
@@ -119,7 +119,7 @@
 # but save the version to allow multiple versions of the same base
 # platform to be built in the same tree.
 #
-ifneq (,$(filter FreeBSD HP-UX IRIX Linux NetBSD OpenBSD OSF1 SunOS,$(OS_ARCH)))
+ifneq (,$(filter MidnightBSD FreeBSD HP-UX IRIX Linux NetBSD OpenBSD OSF1 SunOS,$(OS_ARCH)))
 OS_RELEASE	:= $(basename $(OS_RELEASE))
 
 # Allow the user to ignore the OS_VERSION, which is usually irrelevant.
