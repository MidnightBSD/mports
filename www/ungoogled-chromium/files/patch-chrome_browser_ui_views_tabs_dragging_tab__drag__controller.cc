--- chrome/browser/ui/views/tabs/dragging/tab_drag_controller.cc.orig	2026-10-26 21:13:13 UTC
+++ chrome/browser/ui/views/tabs/dragging/tab_drag_controller.cc
@@ -263,7 +263,7 @@
 
 void UpdateSystemDnDDragImage(TabDragContext* attached_context,
                               const gfx::ImageSkia& image) {
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   VLOG(1) << __func__ << " image size=" << image.size().ToString();
   aura::Window* root_window =
       attached_context->GetWidget()->GetNativeWindow()->GetRootWindow();
@@ -475,7 +475,7 @@
   //     synchronous on desktop Linux, so use that.
   // - ChromeOS Ash
   //     Releasing capture on Ash cancels gestures so avoid it.
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
   ref->can_release_capture_ = false;
 #endif
   ref->start_point_in_screen_ =
@@ -1174,7 +1174,7 @@
       CHECK_EQ(SetCapture(target_context), Liveness::kAlive);
     }
 
-#if !BUILDFLAG(IS_LINUX)
+#if !BUILDFLAG(IS_LINUX) && !BUILDFLAG(IS_BSD)
     const bool is_dragging_all_tabs =
         source_context_ && drag_data_.num_dragging_tabs() ==
                                source_context_->GetTabStripModel()->count();
@@ -2556,7 +2556,7 @@
     }
 
     // If source window was maximized - maximize the new window as well.
-#if !BUILDFLAG(IS_WIN) && !BUILDFLAG(IS_LINUX) && !BUILDFLAG(IS_MAC)
+#if !BUILDFLAG(IS_WIN) && !BUILDFLAG(IS_LINUX) && !BUILDFLAG(IS_MAC) && !BUILDFLAG(IS_BSD)
     // Keeping maximized state breaks snap to Grid on Windows when dragging
     // tabs from maximized windows. TODO:(crbug.com/41321838) Explore doing this
     // for other desktop OS's. kMaximizedStateRetainedOnTabDrag in
