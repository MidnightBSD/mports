--- src/libXNVCtrl/utils.mk.orig	2024-04-04 11:51:35.850976000 -0400
+++ src/libXNVCtrl/utils.mk	2024-04-04 11:51:49.125292000 -0400
@@ -131,6 +131,10 @@
   CFLAGS += -DNV_BSD
 endif
 
+ifeq ($(TARGET_OS),MidnightBSD)
+  CFLAGS += -DNV_BSD
+endif
+
 ifeq ($(TARGET_OS),SunOS)
   CFLAGS += -DNV_SUNOS
 endif
