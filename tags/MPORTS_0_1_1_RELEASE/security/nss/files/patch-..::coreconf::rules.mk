
$FreeBSD: ports/security/nss/files/patch-..::coreconf::rules.mk,v 1.3 2003/04/12 20:58:55 marcus Exp $

--- ../coreconf/rules.mk.orig	Thu Apr  3 16:48:00 2003
+++ ../coreconf/rules.mk	Fri Apr 11 01:01:50 2003
@@ -110,6 +110,7 @@
 endif
 ifdef SHARED_LIBRARY
 	$(INSTALL) -m 775 $(SHARED_LIBRARY) $(SOURCE_LIB_DIR)
+	ln -sf $(notdir $(SHARED_LIBRARY)) $(SOURCE_LIB_DIR)/$(notdir $(SHARED_LIBRARY:.so.1=.so))
 endif
 ifdef IMPORT_LIBRARY
 	$(INSTALL) -m 775 $(IMPORT_LIBRARY) $(SOURCE_LIB_DIR)
