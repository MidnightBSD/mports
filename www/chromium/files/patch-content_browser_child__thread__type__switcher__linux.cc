--- content/browser/child_thread_type_switcher_linux.cc.orig	2026-10-26 21:13:14 UTC
+++ content/browser/child_thread_type_switcher_linux.cc
@@ -9,6 +9,7 @@
 #include "base/containers/flat_map.h"
 #include "base/linux_util.h"
 #include "base/logging.h"
+#include "base/notimplemented.h"
 #include "base/metrics/histogram_macros.h"
 #include "base/process/process_handle.h"
 #include "base/sequence_checker.h"
@@ -33,6 +34,15 @@
 // Finding the thread for a namespaced id means reading
 // /proc/<pid>/task/*/status until one matches, so translations are remembered
 // and only re-validated (one status read) when used again.
+#if BUILDFLAG(IS_BSD)
+class ChildThreadTypeSwitcher::LauncherThreadState {
+ public:
+  explicit LauncherThreadState(base::ProcessId peer_pid) {}
+  void SetThreadTypes(std::vector<mojom::ThreadTypeChangePtr> changes) {
+    NOTIMPLEMENTED();
+  }
+};
+#else
 class ChildThreadTypeSwitcher::LauncherThreadState {
  public:
   explicit LauncherThreadState(base::ProcessId peer_pid)
@@ -112,6 +122,8 @@
   SEQUENCE_CHECKER(sequence_checker_);
 };
 
+#endif  // BUILDFLAG(IS_BSD)
+
 ChildThreadTypeSwitcher::ChildThreadTypeSwitcher() = default;
 
 ChildThreadTypeSwitcher::~ChildThreadTypeSwitcher() = default;
