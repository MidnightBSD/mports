--- hotspot/make/bsd/makefiles/saproc.make.orig	2022-06-24 12:23:14 UTC
+++ hotspot/make/bsd/makefiles/saproc.make
@@ -52,7 +52,7 @@ NON_STUB_SASRCFILES = $(SASRCDIR)/salibe
                       $(SASRCDIR)/ps_core.c           \
                       $(SASRCDIR)/BsdDebuggerLocal.c
 
-ifeq ($(OS_VENDOR), FreeBSD)
+ifeq ($(OS_VENDOR), MidnightBSD)
   SASRCFILES = $(NON_STUB_SASRCFILES)
   SALIBS = -lutil -lthread_db
   SAARCH = $(ARCHFLAG)
