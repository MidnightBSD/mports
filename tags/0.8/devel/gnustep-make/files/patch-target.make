--- target.make.orig	2009-02-09 02:04:28 -0500
+++ target.make	2009-02-09 02:06:35 -0500
@@ -669,6 +669,63 @@
 
 ####################################################
 #
+# MidnightBSD ELF
+#
+ifeq ($(findstring midnightbsd, $(GNUSTEP_TARGET_OS)), midnightbsd)
+HAVE_SHARED_LIBS        = yes
+SHARED_LIB_LINK_CMD = \
+        $(CC) -shared -Wl,-soname,$(LIB_LINK_SONAME_FILE) \
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
+        $(CC) -nostdlib -r $(ALL_LDFLAGS) -o $(GNUSTEP_OBJ_DIR)/$(SUBPROJECT_PRODUCT) $^ ;
+
+SHARED_CFLAGS   += -fPIC
+SHARED_LIBEXT   = .so
+
+HAVE_BUNDLES    = yes
+BUNDLE_LD       = $(CC)
+BUNDLE_LDFLAGS  += -shared
+ADDITIONAL_LDFLAGS += -rdynamic
+STATIC_LDFLAGS += -static
+
+##
+## The -pthread flag must be passed to all compilation/link commands.
+##
+ifeq ($(objc_threaded), -pthread)
+  INTERNAL_CFLAGS += -pthread
+  INTERNAL_OBJCFLAGS += -pthread
+  INTERNAL_LDFLAGS += -pthread
+endif
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
