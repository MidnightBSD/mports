--- src/java.desktop/share/native/libfontmanager/freetypeScaler.c.orig
+++ src/java.desktop/share/native/libfontmanager/freetypeScaler.c
@@ -45,0 +46 @@
+#include <fontconfig/fontconfig.h>
@@ -93,0 +95,127 @@
+
+typedef struct {
+    FT_Render_Mode ftRenderMode;
+    int ftLoadFlags;
+    FT_LcdFilter ftLcdFilter;
+} RenderingProperties;
+
+static FcPattern* matchedPattern(const FcChar8* family, double ptSize) {
+    FcPattern* pattern = FcPatternCreate();
+    if (!pattern)
+        return 0;
+
+    FcPatternAddString(pattern, FC_FAMILY, family);
+    FcPatternAddBool(pattern, FC_SCALABLE, FcTrue);
+    FcPatternAddDouble(pattern, FC_SIZE, ptSize);
+
+    FcConfigSubstitute(0, pattern, FcMatchPattern);
+    FcDefaultSubstitute(pattern);
+
+    FcResult res;
+    FcPattern *match = FcFontMatch(0, pattern, &res);
+    FcPatternDestroy(pattern);
+    return (res == FcResultMatch) ? match : NULL;
+}
+
+static void readFontconfig(const FcChar8* family, double ptSize, jint aaType, RenderingProperties* rp) {
+    FcPattern *pattern = matchedPattern(family, ptSize);
+
+    FT_Render_Mode ftRenderMode = FT_RENDER_MODE_NORMAL;
+    int ftLoadFlags = FT_LOAD_DEFAULT;
+    FT_LcdFilter ftLcdFilter = FT_LCD_FILTER_DEFAULT;
+    FcBool fcAntialias = 0;
+    char horizontal = 1;
+
+    // subpixel order
+    if (aaType == TEXT_AA_ON)
+        ftRenderMode = FT_RENDER_MODE_NORMAL;
+    else if (aaType == TEXT_AA_OFF)
+        ftRenderMode = FT_RENDER_MODE_MONO;
+    else {
+        int fcRGBA = FC_RGBA_UNKNOWN;
+        if (pattern)
+            FcPatternGetInteger(pattern, FC_RGBA, 0, &fcRGBA);
+        switch (fcRGBA) {
+        case FC_RGBA_NONE:
+            ftRenderMode = FT_RENDER_MODE_NORMAL;
+            break;
+        case FC_RGBA_RGB:
+        case FC_RGBA_BGR:
+            ftRenderMode = FT_RENDER_MODE_LCD;
+            horizontal = 1;
+            break;
+        case FC_RGBA_VRGB:
+        case FC_RGBA_VBGR:
+            ftRenderMode = FT_RENDER_MODE_LCD_V;
+            horizontal = 0;
+            break;
+        default:
+            ftRenderMode = FT_RENDER_MODE_NORMAL;
+            break;
+        }
+    }
+
+    // loading mode
+    if (aaType == TEXT_AA_OFF)
+        ftLoadFlags |= FT_LOAD_TARGET_MONO;
+    else {
+        int fcHintStyle = FC_HINT_NONE;
+        if (pattern)
+            FcPatternGetInteger(pattern, FC_HINT_STYLE, 0, &fcHintStyle);
+        switch (fcHintStyle) {
+        case FC_HINT_NONE:
+            ftLoadFlags |= FT_LOAD_NO_HINTING;
+            break;
+        case FC_HINT_SLIGHT:
+            ftLoadFlags |= FT_LOAD_TARGET_LIGHT;
+            break;
+        case FC_HINT_MEDIUM:
+            ftLoadFlags |= FT_LOAD_TARGET_NORMAL;
+            break;
+        case FC_HINT_FULL:
+            if (aaType == TEXT_AA_ON)
+                ftLoadFlags |= FT_LOAD_TARGET_NORMAL;
+            else
+                ftLoadFlags |= horizontal ? FT_LOAD_TARGET_LCD : FT_LOAD_TARGET_LCD_V;
+            break;
+        default:
+            ftLoadFlags |= FT_LOAD_TARGET_NORMAL;
+            break;
+        }
+    }
+
+    // autohinting
+    FcBool fcAutohint = 0;
+    if (pattern && FcPatternGetBool(pattern, FC_AUTOHINT, 0, &fcAutohint) == FcResultMatch)
+        if (fcAutohint)
+            ftLoadFlags |= FT_LOAD_FORCE_AUTOHINT;
+
+    // LCD filter
+    int fcLCDFilter = FC_LCD_DEFAULT;
+    if (pattern)
+        FcPatternGetInteger(pattern, FC_LCD_FILTER, 0, &fcLCDFilter);
+    switch (fcLCDFilter) {
+    case FC_LCD_NONE:
+        ftLcdFilter = FT_LCD_FILTER_NONE;
+        break;
+    case FC_LCD_DEFAULT:
+        ftLcdFilter = FT_LCD_FILTER_DEFAULT;
+        break;
+    case FC_LCD_LIGHT:
+        ftLcdFilter = FT_LCD_FILTER_LIGHT;
+        break;
+    case FC_LCD_LEGACY:
+        ftLcdFilter = FT_LCD_FILTER_LEGACY;
+        break;
+    default:
+        ftLcdFilter = FT_LCD_FILTER_DEFAULT;
+        break;
+    }
+
+    if (pattern)
+        FcPatternDestroy(pattern);
+
+    rp->ftRenderMode = ftRenderMode;
+    rp->ftLoadFlags = ftLoadFlags;
+    rp->ftLcdFilter = ftLcdFilter;
+}
@@ -949,23 +1077,6 @@
-    if (!context->useSbits) {
-        renderFlags |= FT_LOAD_NO_BITMAP;
-    }
-
-    /* NB: in case of non identity transform
-     we might also prefer to disable transform before hinting,
-     and apply it explicitly after hinting is performed.
-     Or we can disable hinting. */
-
-    /* select appropriate hinting mode */
-    if (context->aaType == TEXT_AA_OFF) {
-        target = FT_LOAD_TARGET_MONO;
-    } else if (context->aaType == TEXT_AA_ON) {
-        target = FT_LOAD_TARGET_NORMAL;
-    } else if (context->aaType == TEXT_AA_LCD_HRGB ||
-               context->aaType == TEXT_AA_LCD_HBGR) {
-        target = FT_LOAD_TARGET_LCD;
-    } else {
-        target = FT_LOAD_TARGET_LCD_V;
-    }
-    renderFlags |= target;
-
-    error = FT_Load_Glyph(scalerInfo->face, glyphCode, renderFlags);
+    RenderingProperties renderingProperties;
+    readFontconfig((const FcChar8 *) scalerInfo->face->family_name,
+                   context->ptsz, context->aaType, &renderingProperties);
+
+    FT_Library_SetLcdFilter(scalerInfo->library, renderingProperties.ftLcdFilter);
+    error = FT_Load_Glyph(scalerInfo->face, glyphCode, renderingProperties.ftLoadFlags);
@@ -996,4 +1107,4 @@
-        error = FT_Render_Glyph(ftglyph, FT_LOAD_TARGET_MODE(target));
-        if (error != 0) {
-            return ptr_to_jlong(getNullGlyphImage());
-        }
+    }
+    error = FT_Render_Glyph(ftglyph, renderingProperties.ftRenderMode);
+    if (error != 0) {
+        return ptr_to_jlong(getNullGlyphImage());
@@ -1220,3 +1331,5 @@
-    renderFlags = FT_LOAD_NO_HINTING | FT_LOAD_NO_BITMAP;
-
-    error = FT_Load_Glyph(scalerInfo->face, glyphCode, renderFlags);
+    RenderingProperties renderingProperties;
+    readFontconfig((const FcChar8 *) scalerInfo->face->family_name,
+                   context->ptsz, context->aaType, &renderingProperties);
+
+    error = FT_Load_Glyph(scalerInfo->face, glyphCode, renderingProperties.ftLoadFlags);
