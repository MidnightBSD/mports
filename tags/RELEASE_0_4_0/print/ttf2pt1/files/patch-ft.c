--- ./ft.c.orig	Wed Dec 31 16:30:50 2003
+++ ./ft.c	Thu Nov  1 01:02:09 2007
@@ -12,7 +12,8 @@
 #include <stdlib.h>
 #include <ctype.h>
 #include <sys/types.h>
-#include <freetype/freetype.h>
+#include <ft2build.h>
+#include FT_FREETYPE_H
 #include <freetype/ftglyph.h>
 #include <freetype/ftsnames.h>
 #include <freetype/ttnameid.h>
