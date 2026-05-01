--- content/browser/child_process_launcher_helper_linux.cc.orig	2026-04-30 23:40:01.499255000 -0400
+++ content/browser/child_process_launcher_helper_linux.cc	2026-04-30 23:40:01.504798000 -0400
@@ -73,10 +73,12 @@
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
