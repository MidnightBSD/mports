--- utils.mk.bak	2023-12-07 11:14:33.000000000 -0500
+++ utils.mk	2024-04-04 11:50:35.473693000 -0400
@@ -131,6 +131,11 @@
   CFLAGS += -DNV_BSD
 endif
 
+
+ifeq ($(TARGET_OS),MidnightBSD)
+  CFLAGS += -DNV_BSD
+endif
+
 ifeq ($(TARGET_OS),SunOS)
   CFLAGS += -DNV_SUNOS
 endif
@@ -249,7 +254,7 @@
 
 BINDIR = $(DESTDIR)$(PREFIX)/bin
 LIBDIR = $(DESTDIR)$(PREFIX)/lib
-MANDIR = $(DESTDIR)$(PREFIX)/share/man/man1
+MANDIR = $(DESTDIR)$(PREFIX)/man/man1
 
 
 ##############################################################################
