--- librender/agg/Renderer_agg.cpp.orig	2026-07-06 16:00:30.196120000 -0400
+++ librender/agg/Renderer_agg.cpp
@@ -143,6 +143,10 @@
 #include <agg_alpha_mask_u8.h>
 #pragma GCC diagnostic pop
 
+#ifndef rgba8_pre
+#define rgba8_pre(r, g, b, a) rgba8(agg::rgba_pre(r, g, b, a))
+#endif
+
 #include "Renderer_agg_style.h"
 
 #include "GnashEnums.h"
@@ -471,7 +475,7 @@
         else {
             // Untested.
             typedef agg::scanline_u8_am<agg::alpha_mask_gray8> Scanline;
-            Scanline sl(masks.back().getMask());
+            Scanline sl(const_cast<agg::alpha_mask_gray8&>(masks.back().getMask()));
             renderScanlines(path, rbase, sl);
         }
     } 
@@ -616,7 +620,7 @@
         else {
             // Untested.
             typedef agg::scanline_u8_am<agg::alpha_mask_gray8> Scanline;
-            Scanline sl(masks.back().getMask());
+            Scanline sl(const_cast<agg::alpha_mask_gray8&>(masks.back().getMask()));
             renderScanlines(path, rbase, sl, sg);
         }
     } 
@@ -639,7 +643,7 @@
     // rendering buffer is used to access the frame pixels here        
     agg::rendering_buffer _buf;
 
-    const SourceFormat _pixf;
+    SourceFormat _pixf;
     
     Accessor _accessor;
          
@@ -982,7 +986,7 @@
         else {
             // Mask is active!
             typedef agg::scanline_u8_am<agg::alpha_mask_gray8> sl_type;
-            sl_type sl(_alphaMasks.back().getMask());      
+            sl_type sl(const_cast<agg::alpha_mask_gray8&>(_alphaMasks.back().getMask()));      
             lr.render(sl, stroke, color);
         }
 
@@ -1427,7 +1431,7 @@
       
       typedef agg::scanline_u8_am<agg::alpha_mask_gray8> scanline_type;
       
-      scanline_type sl(_alphaMasks.back().getMask());
+      scanline_type sl(const_cast<agg::alpha_mask_gray8&>(_alphaMasks.back().getMask()));
       
       draw_shape_impl<scanline_type> (paths, agg_paths, 
         sh, even_odd, sl);
@@ -1540,7 +1544,7 @@
       
       typedef agg::scanline_u8_am<agg::alpha_mask_gray8> scanline_type;
       
-      scanline_type sl(_alphaMasks[mask_count - 2].getMask());
+      scanline_type sl(const_cast<agg::alpha_mask_gray8&>(_alphaMasks[mask_count - 2].getMask()));
       
       draw_mask_shape_impl(paths, even_odd, sl);
         
@@ -1634,7 +1638,7 @@
       
       typedef agg::scanline_u8_am<agg::alpha_mask_gray8> scanline_type;
       
-      scanline_type sl(_alphaMasks.back().getMask());
+      scanline_type sl(const_cast<agg::alpha_mask_gray8&>(_alphaMasks.back().getMask()));
       
       draw_outlines_impl<scanline_type> (paths, agg_paths,
         line_styles, cx, linestyle_matrix, sl);
@@ -1843,7 +1847,7 @@
       
       typedef agg::scanline_u8_am<agg::alpha_mask_gray8> sl_type; 
       
-      sl_type sl(_alphaMasks.back().getMask());
+      sl_type sl(const_cast<agg::alpha_mask_gray8&>(_alphaMasks.back().getMask()));
          
       draw_poly_impl<sl_type>(&corners.front(), corners.size(), fill, outline, sl, mat);       
     
