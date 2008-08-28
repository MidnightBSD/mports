--- cmd/platlibs.mk.orig	Mon May 15 18:11:16 2006
+++ cmd/platlibs.mk	Tue Sep 19 19:58:46 2006
@@ -70,7 +70,6 @@
 	$(DIST)/lib/$(LIB_PREFIX)nsspki.$(LIB_SUFFIX) \
 	$(DIST)/lib/$(LIB_PREFIX)nssdev.$(LIB_SUFFIX) \
 	$(DIST)/lib/$(LIB_PREFIX)nssb.$(LIB_SUFFIX) \
-	$(DIST)/lib/$(LIB_PREFIX)dbm.$(LIB_SUFFIX) \
 	$(NSPR_LIB_DIR)/$(NSPR31_LIB_PREFIX)plc4.$(LIB_SUFFIX) \
 	$(NSPR_LIB_DIR)/$(NSPR31_LIB_PREFIX)plds4.$(LIB_SUFFIX) \
 	$(NSPR_LIB_DIR)/$(NSPR31_LIB_PREFIX)nspr4.$(LIB_SUFFIX) \
@@ -113,7 +112,6 @@
 	$(DIST)/lib/$(LIB_PREFIX)nssb.$(LIB_SUFFIX) \
 	$(CRYPTOLIB) \
 	$(DIST)/lib/$(LIB_PREFIX)secutil.$(LIB_SUFFIX) \
-	$(DIST)/lib/$(LIB_PREFIX)dbm.$(LIB_SUFFIX) \
 	$(NULL)
 
 ifeq ($(OS_ARCH), AIX) 
@@ -176,7 +174,7 @@
 # If GNU ld is used, we must use the -rpath-link option to tell
 # the linker where to find libsoftokn3.so, an implicit dependency
 # of libnss3.so.
-ifeq (,$(filter-out BSD_OS FreeBSD Linux NetBSD, $(OS_ARCH)))
+ifeq (,$(filter-out BSD_OS FreeBSD MidnightBSD Linux NetBSD, $(OS_ARCH)))
 EXTRA_SHARED_LIBS += -Wl,-rpath-link,$(DIST)/lib
 endif
 
