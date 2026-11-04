--- hotspot/make/bsd/makefiles/saproc.make.orig
+++ hotspot/make/bsd/makefiles/saproc.make
@@ -58,7 +58,7 @@
                       $(SASRCDIR)/MacosxDebuggerLocal.m      \
                       $(AGENT_DIR)/src/share/native/sadis.c
 
-ifeq ($(OS_VENDOR), FreeBSD)
+ifneq (,$(filter $(OS_VENDOR), FreeBSD MidnightBSD))
   SASRCFILES = $(BSD_NON_STUB_SASRCFILES)
   SALIBS = -lutil -lthread_db
   SAARCH = $(ARCHFLAG)
@@ -87,7 +87,7 @@
 
 
 ifneq ($(OS_VENDOR), Darwin)
-SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE))
+SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE)) -Xlinker --undefined-version
 else
 # bring in minimum version argument or we'll fail on OSX 10.10
 SA_LFLAGS = $(LFLAGS)
