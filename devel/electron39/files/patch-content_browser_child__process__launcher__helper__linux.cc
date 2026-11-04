--- content/browser/child_process_launcher_helper_linux.cc.orig	2026-06-02 12:58:33.504423000 -0400
+++ content/browser/child_process_launcher_helper_linux.cc	2026-06-02 18:20:53.884312000 -0400
@@ -11,8 +11,10 @@
 #include "content/browser/child_process_launcher_helper.h"
 #include "content/browser/child_process_launcher_helper_posix.h"
 #include "content/browser/sandbox_host_linux.h"
+#if BUILDFLAG(USE_ZYGOTE)
 #include "content/browser/zygote_host/zygote_host_impl_linux.h"
 #include "content/common/zygote/zygote_communication_linux.h"
+#endif
 #include "content/public/browser/child_process_launcher_utils.h"
 #include "content/public/browser/content_browser_client.h"
 #include "content/public/common/content_client.h"
@@ -22,7 +24,9 @@
 #include "content/public/common/result_codes.h"
 #include "content/public/common/sandboxed_process_launcher_delegate.h"
 #include "content/public/common/zygote/sandbox_support_linux.h"
+#if BUILDFLAG(USE_ZYGOTE)
 #include "content/public/common/zygote/zygote_handle.h"
+#endif
 #include "sandbox/policy/linux/sandbox_linux.h"

 namespace content {
@@ -47,14 +51,20 @@ std::unique_ptr<FileMappedForLaunch>
 }

 bool ChildProcessLauncherHelper::IsUsingLaunchOptions() {
+#if BUILDFLAG(USE_ZYGOTE)
   return !GetZygoteForLaunch();
+#else
+  return true;
+#endif
 }

 bool ChildProcessLauncherHelper::BeforeLaunchOnLauncherThread(
     PosixFileDescriptorInfo& files_to_register,
     base::LaunchOptions* options) {
   if (options) {
+#if BUILDFLAG(USE_ZYGOTE)
     DCHECK(!GetZygoteForLaunch());
+#endif
     // Convert FD mapping to FileHandleMappingVector
     options->fds_to_remap = files_to_register.GetMappingWithIDAdjustment(
         base::GlobalDescriptors::kBaseDescriptor);
@@ -73,19 +83,23 @@ bool ChildProcessLauncherHelper::BeforeL
     // launching an unsandboxed process (since all sandboxed processes are
     // forked from the zygote). Relax the allow_new_privs option to permit
     // launching suid processes from unsandboxed child processes.
+#if !BUILDFLAG(IS_BSD)
     if (!base::CommandLine::ForCurrentProcess()->HasSwitch(switches::kNoZygote) &&
         delegate_->GetZygote() == nullptr) {
       options->allow_new_privs = true;
     }
+#endif

     options->current_directory = delegate_->GetCurrentDirectory();
     options->environment = delegate_->GetEnvironment();
     options->clear_environment = !delegate_->ShouldInheritEnvironment();
   } else {
+#if BUILDFLAG(USE_ZYGOTE)
     DCHECK(GetZygoteForLaunch());
     // Environment variables could be supported in the future, but are not
     // currently supported when launching with the zygote.
     DCHECK(delegate_->GetEnvironment().empty());
+#endif
   }

   return true;
@@ -99,6 +113,7 @@ ChildProcessLauncherHelper::LaunchProces
     int* launch_result) {
   *is_synchronous_launch = true;
   Process process;
+#if BUILDFLAG(USE_ZYGOTE)
   ZygoteCommunication* zygote_handle = GetZygoteForLaunch();
   if (zygote_handle) {
     // TODO(crbug.com/40448989): If chrome supported multiple zygotes they could
@@ -123,10 +138,13 @@ ChildProcessLauncherHelper::LaunchProces
     process.process = base::Process(handle);
     process.zygote = zygote_handle;
   } else {
+#endif
     process.process = base::LaunchProcess(*command_line(), *options);
     *launch_result = process.process.IsValid() ? LAUNCH_RESULT_SUCCESS
                                                : LAUNCH_RESULT_FAILURE;
+#if BUILDFLAG(USE_ZYGOTE)
   }
+#endif

 #if BUILDFLAG(IS_CHROMEOS)
   process_id_ = process.process.Pid();
@@ -150,10 +168,13 @@ ChildProcessTerminationInfo ChildProcess
     const ChildProcessLauncherHelper::Process& process,
     bool known_dead) {
   ChildProcessTerminationInfo info;
+#if BUILDFLAG(USE_ZYGOTE)
   if (process.zygote) {
     info.status = process.zygote->GetTerminationStatus(
         process.process.Handle(), known_dead, &info.exit_code);
-  } else if (known_dead) {
+  } else
+#endif
+  if (known_dead) {
     info.status = base::GetKnownDeadTerminationStatus(process.process.Handle(),
                                                       &info.exit_code);
   } else {
@@ -179,13 +200,17 @@ void ChildProcessLauncherHelper::ForceNo
   DCHECK(CurrentlyOnProcessLauncherTaskRunner());
   process.process.Terminate(RESULT_CODE_NORMAL_EXIT, false);
   // On POSIX, we must additionally reap the child.
+#if BUILDFLAG(USE_ZYGOTE)
   if (process.zygote) {
     // If the renderer was created via a zygote, we have to proxy the reaping
     // through the zygote process.
     process.zygote->EnsureProcessTerminated(process.process.Handle());
   } else {
+#endif
     base::EnsureProcessTerminated(std::move(process.process));
+#if BUILDFLAG(USE_ZYGOTE)
   }
+#endif
 }

 void ChildProcessLauncherHelper::SetProcessPriorityOnLauncherThread(
@@ -197,11 +222,13 @@ void ChildProcessLauncherHelper::SetProc
   }
 }

+#if BUILDFLAG(USE_ZYGOTE)
 ZygoteCommunication* ChildProcessLauncherHelper::GetZygoteForLaunch() {
   return base::CommandLine::ForCurrentProcess()->HasSwitch(switches::kNoZygote)
              ? nullptr
              : delegate_->GetZygote();
 }
+#endif

 base::File OpenFileToShare(const base::FilePath& path,
                            base::MemoryMappedFile::Region* region) {
