--- libxmlsec/makefile.mk.orig	2026-05-05 08:30:27.289941000 -0400
+++ libxmlsec/makefile.mk	2026-05-05 08:30:27.291358000 -0400
@@ -63,6 +63,8 @@
    xmlsec1-mingw32.patch \
    xmlsec1-mingw-keymgr-mscrypto.patch
 
+PATCH_FILES+=xmlsec1-midnightbsd.patch
+
 .IF "$(GUI)"=="OS2"
 PATCH_FILES+=xmlsec1-os2.patch
 .ENDIF
