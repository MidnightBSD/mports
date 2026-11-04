--- device/vr/openxr/test/openxr_mock_helper.cc.orig	2026-10-26 21:13:13 UTC
+++ device/vr/openxr/test/openxr_mock_helper.cc	2026-10-29 12:08:07 UTC
@@ -73,7 +73,7 @@
   if (library_path.empty()) {
     library_path = base::FilePath("libmockopenxrruntime.so");
   }
-#elif BUILDFLAG(IS_LINUX)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   // :openxr_mock puts the trampoline next to its manifest, in the same
   // mock_vr_clients/bin/openxr/ directory the Windows runtime uses.
   base::FilePath exe_dir;
