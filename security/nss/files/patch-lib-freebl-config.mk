--- lib/freebl/config.mk.orig	2018-11-23 15:58:51.366450000 -0500
+++ lib/freebl/config.mk	2018-11-23 15:59:15.036996000 -0500
@@ -90,7 +90,7 @@
 endif
 endif
 
-ifeq (,$(filter-out DragonFly FreeBSD Linux NetBSD OpenBSD, $(OS_TARGET)))
+ifeq (,$(filter-out DragonFly FreeBSD Linux MidnightBSD NetBSD OpenBSD, $(OS_TARGET)))
 CFLAGS += -std=gnu99
 endif
 
