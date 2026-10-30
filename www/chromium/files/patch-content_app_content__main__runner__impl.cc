--- content/app/content_main_runner_impl.cc.orig	2026-10-26 21:13:13 UTC
+++ content/app/content_main_runner_impl.cc
@@ -162,13 +162,13 @@
 #include "content/browser/posix_file_descriptor_info_impl.h"
 #include "content/public/common/content_descriptors.h"
 
-#if !BUILDFLAG(IS_MAC)
+#if !BUILDFLAG(IS_MAC) && !BUILDFLAG(IS_BSD)
 #include "content/public/common/zygote/zygote_fork_delegate_linux.h"
 #endif
 
 #endif  // BUILDFLAG(IS_POSIX) || BUILDFLAG(IS_FUCHSIA)
 
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
 #include <fcntl.h>
 
 #include "base/environment.h"
@@ -178,7 +178,10 @@
 #include "base/posix/eintr_wrapper.h"
 #include "base/rand_util.h"
 #include "content/public/common/zygote/sandbox_support_linux.h"
+#if !BUILDFLAG(IS_BSD)
 #include "sandbox/policy/linux/sandbox_linux.h"
+#endif
+#include "third_party/skia/rust/png/FFI.rs.h"
 #include "third_party/boringssl/src/include/openssl/crypto.h"
 #include "third_party/webrtc_overrides/init_webrtc.h"  // nogncheck
 
@@ -200,6 +203,10 @@
 #include "content/public/common/zygote/zygote_handle.h"
 #include "content/zygote/zygote_main.h"
 #include "media/base/media_switches.h"
+#endif
+
+#if BUILDFLAG(IS_BSD)
+#include "base/system/sys_info.h"
 #endif
 
 #if BUILDFLAG(IS_ANDROID)
@@ -375,7 +382,7 @@
 }
 #endif  // BUILDFLAG(USE_ZYGOTE)
 
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
 
 #if BUILDFLAG(ENABLE_LIBRARY_CDMS)
 // Loads registered library CDMs but does not initialize them. This is needed by
@@ -422,8 +429,10 @@
 }
 
 void PreSandboxInit() {
-  // Ensure the /dev/urandom is opened.
+  // Ensure the /dev/urandom is opened on platforms that use it.
+#if !BUILDFLAG(IS_BSD)
   base::GetUrandomFD();
+#endif
 
   // May use sysinfo(), sched_getaffinity(), and open various /sys/ and /proc/
   // files.
@@ -435,9 +444,16 @@
   // https://boringssl.googlesource.com/boringssl/+/HEAD/SANDBOXING.md
   CRYPTO_pre_sandbox_init();
 
+#if BUILDFLAG(IS_BSD)
+  // Cache Rust PNG CPU features before entering the sandbox.
+  rust_png::initialize_cpudetect();
+#endif
+
+#if !BUILDFLAG(IS_BSD)
   // Pre-read /proc/sys/fs/inotify/max_user_watches so it doesn't have to be
   // allowed by the sandbox.
   base::GetMaxNumberOfInotifyWatches();
+#endif
 
 #if BUILDFLAG(ENABLE_LIBRARY_CDMS)
   // Ensure access to the library CDMs before the sandbox is turned on.
@@ -687,7 +703,7 @@
   // Once Zygote forks and feature list initializes we can start a thread to
   // begin tracing immediately.
   if (delegate->ShouldInitializePerfetto(invoked_in_child)) {
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
     if (process_type == switches::kGpuProcess) {
       tracing::InitTracingPostFeatureList(/*enable_consumer=*/false,
                                           /*will_trace_thread_restart=*/true);
@@ -792,7 +808,7 @@
     base::HangWatcher::CreateHangWatcherInstance();
     unregister_thread_closure = base::HangWatcher::RegisterThread(
         base::HangWatcher::ThreadType::kMainThread);
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
     // On Linux/ChromeOS, the HangWatcher can't start until after the sandbox is
     // initialized, because the sandbox can't be started with multiple threads.
     // TODO(mpdenton): start the HangWatcher after the sandbox is initialized.
@@ -923,11 +939,10 @@
                  base::GlobalDescriptors::kBaseDescriptor);
 #endif  // !BUILDFLAG(IS_ANDROID)
 
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_OPENBSD)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
   g_fds->Set(kCrashDumpSignal,
              kCrashDumpSignal + base::GlobalDescriptors::kBaseDescriptor);
-#endif  // BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) ||
-        // BUILDFLAG(IS_OPENBSD)
+#endif  // BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
 
 #endif  // !BUILDFLAG(IS_WIN)
 
@@ -1061,7 +1076,7 @@
 
   delegate_->PreSandboxStartup();
 
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
   // Set environment variables for fontconfig fontations indexing and before
   // creating threads.
   if (process_type.empty()) {
@@ -1096,7 +1111,7 @@
     // SeatbeltExecServer.
     CHECK(sandbox::Seatbelt::IsSandboxed());
   }
-#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
   // In sandboxed processes and zygotes, certain resource should be pre-warmed
   // as they cannot be initialized under a sandbox. In addition, loading these
   // resources in zygotes (including the unsandboxed zygote) allows them to be
@@ -1108,6 +1123,16 @@
   }
 #elif BUILDFLAG(IS_IOS) && !BUILDFLAG(IS_IOS_TVOS)
   ChildProcessEnterSandbox();
+#endif
+
+#if BUILDFLAG(IS_BSD)
+  if (process_type.empty()) {
+    sandbox::policy::SandboxLinux::Options sandbox_options;
+    sandbox::policy::SandboxLinux::GetInstance()->InitializeSandbox(
+        sandbox::policy::SandboxTypeFromCommandLine(
+            *base::CommandLine::ForCurrentProcess()),
+        sandbox::policy::SandboxLinux::PreSandboxHook(), sandbox_options);
+  }
 #endif
 
   delegate_->SandboxInitialized(process_type);
@@ -1239,6 +1264,11 @@
 
   RegisterMainThreadFactories();
 
+#if BUILDFLAG(IS_BSD)
+  if (!process_type.empty())
+    PreSandboxInit();
+#endif 
+
   if (process_type.empty()) {
     return RunBrowser(std::move(main_params), start_minimal_browser);
   }
