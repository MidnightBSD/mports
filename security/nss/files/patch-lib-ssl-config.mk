--- lib/ssl/config.mk.orig	2018-11-23 15:54:20.341828000 -0500
+++ lib/ssl/config.mk	2018-11-23 15:54:37.116478000 -0500
@@ -61,6 +61,6 @@
 DEFINES += -DNSS_DISABLE_TLS_1_3
 endif
 
-ifeq (,$(filter-out DragonFly FreeBSD Linux NetBSD OpenBSD, $(OS_TARGET)))
+ifeq (,$(filter-out DragonFly FreeBSD Linux MidnightBSD NetBSD OpenBSD, $(OS_TARGET)))
 CFLAGS += -std=gnu99
 endif
