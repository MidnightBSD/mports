--- coreconf/arch.mk.orig	2018-10-15 23:55:45.000000000 -0400
+++ coreconf/arch.mk	2018-11-23 16:07:09.150320000 -0500
@@ -26,7 +26,7 @@
 # Attempt to differentiate between sparc and x86 Solaris
 #
 
-OS_TEST := $(shell uname -m)
+OS_TEST := $(shell uname -p)
 ifeq ($(OS_TEST),i86pc)
     OS_RELEASE := $(shell uname -r)_$(OS_TEST)
 else
@@ -106,7 +106,7 @@
 # IRIX 6.5-ALPHA-1289139620.
 #
 
-ifeq (,$(filter-out Linux FreeBSD IRIX,$(OS_ARCH)))
+ifeq (,$(filter-out Linux FreeBSD MidnightBSD IRIX,$(OS_ARCH)))
     OS_RELEASE := $(shell echo $(OS_RELEASE) | sed 's/-.*//')
 endif
 
