--- coreconf/arch.mk.orig	2022-09-15 17:27:38 UTC
+++ coreconf/arch.mk
@@ -26,7 +26,7 @@ OS_ARCH := $(subst /,_,$(shell uname -s)
 # Attempt to differentiate between sparc and x86 Solaris
 #
 
-OS_TEST := $(shell uname -m)
+OS_TEST := $(shell uname -p)
 ifeq ($(OS_TEST),i86pc)
     OS_RELEASE := $(shell uname -r)_$(OS_TEST)
 else
