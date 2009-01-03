--- ./src/unix-dll.mak.orig	2009-01-03 14:55:23 -0500
+++ ./src/unix-dll.mak	2009-01-03 14:57:45 -0500
@@ -108,19 +108,19 @@
 	$(MAKE) $(SODEFS) GENOPT='-DDEBUG' CFLAGS='$(CFLAGS_DEBUG) $(CFLAGS_SO) $(GCFLAGS) $(XCFLAGS)' $(GSSOC) $(GSSOX)
 
 install-so: so
-	-mkdir -p $(prefix)
-	-mkdir -p $(datadir)
-	-mkdir -p $(gsdir)
-	-mkdir -p $(gsdatadir)
-	-mkdir -p $(bindir)
-	-mkdir -p $(libdir)
-	$(INSTALL_PROGRAM) $(GSSOC) $(bindir)/$(GSSOC_XENAME)
-	$(INSTALL_PROGRAM) $(GSSOX) $(bindir)/$(GSSOX_XENAME)
-	$(INSTALL_PROGRAM) $(BINDIR)/$(SOBINRELDIR)/$(GS_SONAME_MAJOR_MINOR) $(libdir)/$(GS_SONAME_MAJOR_MINOR)
-	$(RM_) $(libdir)/$(GS_SONAME)
-	ln -s $(GS_SONAME_MAJOR_MINOR) $(libdir)/$(GS_SONAME)
-	$(RM_) $(libdir)/$(GS_SONAME_MAJOR)
-	ln -s $(GS_SONAME_MAJOR_MINOR) $(libdir)/$(GS_SONAME_MAJOR)
+	-mkdir -p $(DESTDIR)$(prefix)
+	-mkdir -p $(DESTDIR)$(datadir)
+	-mkdir -p $(DESTDIR)$(gsdir)
+	-mkdir -p $(DESTDIR)$(gsdatadir)
+	-mkdir -p $(DESTDIR)$(bindir)
+	-mkdir -p $(DESTDIR)$(libdir)
+	$(INSTALL_PROGRAM) $(GSSOC) $(DESTDIR)$(bindir)/$(GSSOC_XENAME)
+	$(INSTALL_PROGRAM) $(GSSOX) $(DESTDIR)$(bindir)/$(GSSOX_XENAME)
+	$(INSTALL_PROGRAM) $(BINDIR)/$(SOBINRELDIR)/$(GS_SONAME_MAJOR_MINOR) $(DESTDIR)$(libdir)/$(GS_SONAME_MAJOR_MINOR)
+	$(RM_) $(DESTDIR)$(libdir)/$(GS_SONAME)
+	ln -s $(GS_SONAME_MAJOR_MINOR) $(DESTDIR)$(libdir)/$(GS_SONAME)
+	$(RM_) $(DESTDIR)$(libdir)/$(GS_SONAME_MAJOR)
+	ln -s $(GS_SONAME_MAJOR_MINOR) $(DESTDIR)$(libdir)/$(GS_SONAME_MAJOR)
 
 soinstall: install-so install-scripts install-data
 
