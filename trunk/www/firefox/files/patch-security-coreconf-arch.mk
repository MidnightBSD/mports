--- security/coreconf/arch.mk.orig	Fri Oct 19 21:10:25 2007
+++ security/coreconf/arch.mk	Fri Oct 19 21:10:35 2007
@@ -146,7 +146,7 @@
 # IRIX 6.5-ALPHA-1289139620.
 #
 
-ifeq (,$(filter-out Linux FreeBSD IRIX,$(OS_ARCH)))
+ifeq (,$(filter-out Linux MidnightBSD FreeBSD IRIX,$(OS_ARCH)))
     OS_RELEASE := $(shell echo $(OS_RELEASE) | sed 's/-.*//')
 endif
 
