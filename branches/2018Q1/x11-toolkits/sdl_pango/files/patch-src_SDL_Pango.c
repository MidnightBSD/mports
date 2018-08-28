--- src/SDL_Pango.c.orig	2016-08-12 03:36:39.011601549 -0400
+++ src/SDL_Pango.c	2016-08-12 03:37:47.862601477 -0400
@@ -330,6 +330,11 @@
     @param *rect [in] Draw on this area
     @param baseline [in] Horizontal location of glyphs
 */
+void SDLPango_CopyFTBitmapToSurface(
+    const FT_Bitmap *bitmap,
+    SDL_Surface *surface,
+    const SDLPango_Matrix *matrix,
+    SDL_Rect *rect);
 static void
 drawGlyphString(
     SDLPango_Context *context,
