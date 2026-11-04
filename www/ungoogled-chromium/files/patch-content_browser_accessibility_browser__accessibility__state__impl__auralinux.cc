--- content/browser/accessibility/browser_accessibility_state_impl_auralinux.cc.orig	2026-10-26 21:13:13 UTC
+++ content/browser/accessibility/browser_accessibility_state_impl_auralinux.cc
@@ -18,6 +18,7 @@
 #include "base/callback_list.h"
 #include "base/debug/crash_logging.h"
 #include "base/logging.h"
 #include "base/metrics/histogram_macros.h"
+#include "base/notimplemented.h"
 #include "base/task/thread_pool.h"
 #include "content/browser/accessibility/browser_accessibility_state_impl.h"
@@ -61,6 +62,10 @@
 
 // Returns true if Orca is active.
 bool DiscoverOrca() {
+#if BUILDFLAG(IS_BSD)
+  NOTIMPLEMENTED();
+  return false;
+#else
   // NOTE: this method is run from another thread to reduce jank, since
   // there's no guarantee these system calls will return quickly.
   std::unique_ptr<DIR, decltype(&CloseDir)> proc_dir(opendir("/proc"),
@@ -107,6 +112,7 @@
   }
 
   return is_orca_active;
+#endif
 }
 
 }  // namespace
