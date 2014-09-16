--- ./cc/layers/layer_impl.cc.orig	2014-08-12 21:03:00.000000000 +0200
+++ ./cc/layers/layer_impl.cc	2014-08-13 09:56:56.000000000 +0200
@@ -1215,21 +1215,23 @@
                                scale_factor * scaled_scroll_bounds.height());
   scaled_scroll_bounds = gfx::ToFlooredSize(scaled_scroll_bounds);
 
-  gfx::Vector2dF max_offset(
+  // (rene) prevent name collision with /usr/include/vm/vm_map.h on FreeBSD
+  // which also defines max_offset
+  gfx::Vector2dF _max_offset(
       scaled_scroll_bounds.width() - scroll_clip_layer_->bounds().width(),
       scaled_scroll_bounds.height() - scroll_clip_layer_->bounds().height());
   // We need the final scroll offset to be in CSS coords.
-  max_offset.Scale(1 / scale_factor);
-  max_offset.SetToMax(gfx::Vector2dF());
-  return gfx::ToFlooredVector2d(max_offset);
+  _max_offset.Scale(1 / scale_factor);
+  _max_offset.SetToMax(gfx::Vector2dF());
+  return gfx::ToFlooredVector2d(_max_offset);
 }
 
 gfx::Vector2dF LayerImpl::ClampScrollToMaxScrollOffset() {
-  gfx::Vector2dF max_offset = MaxScrollOffset();
+  gfx::Vector2dF _max_offset = MaxScrollOffset();
   gfx::Vector2dF old_offset = TotalScrollOffset();
   gfx::Vector2dF clamped_offset = old_offset;
 
-  clamped_offset.SetToMin(max_offset);
+  clamped_offset.SetToMin(_max_offset);
   clamped_offset.SetToMax(gfx::Vector2d());
   gfx::Vector2dF delta = clamped_offset - old_offset;
   if (!delta.IsZero())
