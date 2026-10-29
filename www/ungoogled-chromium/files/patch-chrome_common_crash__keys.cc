--- chrome/common/crash_keys.cc.orig	2026-10-26 21:13:13 UTC
+++ chrome/common/crash_keys.cc
@@ -126,6 +126,7 @@
   GetCommandLineStringAnnotations().emplace_back(std::string(key)).Set(value);
 }
 
+#if BUILDFLAG(USE_CRASHPAD_ANNOTATION)
 void AppendStringAnnotationsCommandLineSwitch(base::CommandLine* command_line) {
   std::string string_annotations;
   for (const auto& crash_key : GetCommandLineStringAnnotations()) {
@@ -140,6 +141,7 @@
   }
   command_line->AppendSwitchASCII(kStringAnnotationsSwitch, string_annotations);
 }
+#endif
 
 void SetCrashKeysFromCommandLine(const base::CommandLine& command_line) {
   SetStringAnnotations(command_line);
