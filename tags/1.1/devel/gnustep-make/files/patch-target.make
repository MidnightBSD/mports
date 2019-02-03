--- target.make.orig	2016-11-22 17:43:57.000000000 -0500
+++ target.make	2018-09-09 14:18:20.478316000 -0400
@@ -681,6 +681,55 @@
 
 ####################################################
 #
+# MidnightBSD ELF
+#
+ifeq ($(findstring midnightbsd, $(GNUSTEP_TARGET_OS)), midnightbsd)
+HAVE_SHARED_LIBS        = yes
+SHARED_LIB_LINK_CMD = \
+        $(LD) -shared -Wl,-soname,$(LIB_LINK_SONAME_FILE) \
+           $(ALL_LDFLAGS) -o $(LIB_LINK_OBJ_DIR)/$(LIB_LINK_VERSION_FILE) $^ \
+           $(INTERNAL_LIBRARIES_DEPEND_UPON) \
+           $(SHARED_LD_POSTFLAGS) \
+        && (cd $(LIB_LINK_OBJ_DIR); \
+          $(RM_LN_S) $(LIB_LINK_FILE); \
+          if [ "$(LIB_LINK_SONAME_FILE)" != "$(LIB_LINK_VERSION_FILE)" ]; then\
+            $(RM_LN_S) $(LIB_LINK_SONAME_FILE);\
+            $(LN_S) $(LIB_LINK_VERSION_FILE) $(LIB_LINK_SONAME_FILE); \
+          fi; \
+          $(LN_S) $(LIB_LINK_SONAME_FILE) $(LIB_LINK_FILE))
+AFTER_INSTALL_SHARED_LIB_CMD = \
+        (cd $(LIB_LINK_INSTALL_DIR); \
+          $(RM_LN_S) $(LIB_LINK_FILE); \
+          if [ "$(LIB_LINK_SONAME_FILE)" != "$(LIB_LINK_VERSION_FILE)" ]; then\
+            $(RM_LN_S) $(LIB_LINK_SONAME_FILE);\
+            $(LN_S) $(LIB_LINK_VERSION_FILE) $(LIB_LINK_SONAME_FILE); \
+          fi; \
+          $(LN_S) $(LIB_LINK_SONAME_FILE) $(LIB_LINK_FILE); \
+        )
+AFTER_INSTALL_SHARED_LIB_CHOWN = \
+        (cd $(LIB_LINK_INSTALL_DIR); \
+        chown $(CHOWN_TO) $(LIB_LINK_SONAME_FILE); \
+        chown $(CHOWN_TO) $(LIB_LINK_FILE))
+OBJ_MERGE_CMD           = \
+        $(LD) -nostdlib $(OBJ_MERGE_CMD_FLAG) $(ALL_LDFLAGS) -o $(GNUSTEP_OBJ_DIR)/$(SUBPROJECT_PRODUCT) $^ ;
+
+SHARED_CFLAGS   += -fPIC
+SHARED_LIBEXT   = .so
+
+HAVE_BUNDLES    = yes
+BUNDLE_LD       = $(LD)
+BUNDLE_LDFLAGS  += -shared
+ADDITIONAL_LDFLAGS += -rdynamic
+STATIC_LDFLAGS += -static
+
+endif
+#
+# end MidnightBSD
+#
+####################################################
+
+####################################################
+#
 # NetBSD (ELF)
 #
 ifeq ($(findstring netbsd, $(GNUSTEP_TARGET_OS)), netbsd)
