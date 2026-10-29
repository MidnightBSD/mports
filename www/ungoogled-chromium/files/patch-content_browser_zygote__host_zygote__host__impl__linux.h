--- content/browser/zygote_host/zygote_host_impl_linux.h.orig	2026-10-26 21:13:13 UTC
+++ content/browser/zygote_host/zygote_host_impl_linux.h	2026-10-29 10:53:34 UTC
@@ -18,8 +18,12 @@
 #include "base/synchronization/lock.h"
 #include "base/thread_annotations.h"
 #include "content/common/content_export.h"
+#include "content/public/browser/zygote_host/zygote_host_linux.h"
+#include "content/public/common/zygote/zygote_buildflags.h"
+
+#if BUILDFLAG(USE_ZYGOTE)
 #include "content/common/zygote/zygote_handle_impl_linux.h"
-#include "content/public/browser/zygote_host/zygote_host_linux.h"
+#endif
 
 #if BUILDFLAG(IS_CHROMEOS)
 #include "base/files/platform_file.h"
@@ -44,19 +48,23 @@
 
   int GetRendererSandboxStatus() override;
 
+#if BUILDFLAG(USE_ZYGOTE)
   // Starts a zygote process and returns a callback that waits for it to become
   // ready. See ZygoteLaunchCallback.
   ZygoteLaunchCompletionCallback LaunchZygote(
       base::CommandLine* cmd_line,
       base::ScopedFD* control_fd,
       base::FileHandleMappingVector additional_remapped_fds);
+#endif
 
+#if !BUILDFLAG(IS_BSD)
   void AdjustRendererOOMScore(base::ProcessHandle process_handle,
                               int score) override;
 #if BUILDFLAG(IS_CHROMEOS)
   void ReinitializeLogging(uint32_t logging_dest,
                            base::PlatformFile log_file_fd) override;
 #endif  // BUILDFLAG(IS_CHROMEOS)
+#endif
 
   bool HasZygote() { return has_zygote_; }
 
@@ -66,9 +74,11 @@
   ZygoteHostImpl();
   ~ZygoteHostImpl() override;
 
+#if BUILDFLAG(USE_ZYGOTE)
   // Waits for a zygote started inside the namespace or setuid sandbox to
   // report that it is running, and returns its pid.
   pid_t FinishSandboxedZygoteLaunch(base::Process process, int control_fd);
+#endif
 
   // Tells the ZygoteHost the PIDs of all the zygotes.
   void AddZygotePid(pid_t pid);
@@ -77,9 +87,11 @@
   // other threads are created.
   bool has_zygote_ = false;
 
+#if !BUILDFLAG(IS_BSD)
   bool use_namespace_sandbox_;
   bool use_suid_sandbox_;
   bool use_suid_sandbox_for_adj_oom_score_;
+#endif
   std::string sandbox_binary_;
 
   base::Lock zygote_pids_lock_;
