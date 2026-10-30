--- chrome/browser/ui/views/tabs/common/horizontal_tab_style_views.cc.orig	2026-10-26 21:13:13 UTC
+++ chrome/browser/ui/views/tabs/common/horizontal_tab_style_views.cc
@@ -453,7 +453,8 @@
   if (!IsHoverAnimationActive()) {
     return base_opacity;
   }
-  return std::lerp(base_opacity, GetHoverOpacity(), GetHoverAnimationValue());
+  return std::lerp(base_opacity, GetHoverOpacity(),
+                   static_cast<float>(GetHoverAnimationValue()));
 }
 
 TabStyle::TabColors HorizontalTabStyleViews::CalculateTargetColors() const {
