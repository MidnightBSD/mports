--- hotspot/make/bsd/makefiles/saproc.make.orig	2016-09-03 19:01:43.787158206 -0400
+++ hotspot/make/bsd/makefiles/saproc.make	2016-09-03 19:02:03.386158156 -0400
@@ -47,7 +47,7 @@
                       $(SASRCDIR)/ps_core.c           \
                       $(SASRCDIR)/BsdDebuggerLocal.c
 
-ifeq ($(OS_VENDOR), FreeBSD)
+ifeq ($(OS_VENDOR), MidnightBSD)
   SASRCFILES = $(NON_STUB_SASRCFILES)
   SALIBS = -lutil -lthread_db
   SAARCH = $(ARCHFLAG)
