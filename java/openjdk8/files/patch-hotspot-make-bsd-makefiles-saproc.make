--- hotspot/make/bsd/makefiles/saproc.make.orig
+++ hotspot/make/bsd/makefiles/saproc.make
@@ -60 +60 @@
-ifeq ($(OS_VENDOR), FreeBSD)
+ifneq (,$(filter $(OS_VENDOR), FreeBSD MidnightBSD))
@@ -119 +119 @@
-  SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE))
+  SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE)) -Xlinker --undefined-version
