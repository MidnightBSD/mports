--- llvm/tools/llvm-readobj/ELFDumper.cpp.orig	2026-10-13 10:01:55.000000000 -0400
+++ llvm/tools/llvm-readobj/ELFDumper.cpp	2026-11-13 00:24:26.100781000 -0500
@@ -1144,7 +1144,8 @@
     {{"CloudABI", "CloudABI"}, ELF::ELFOSABI_CLOUDABI},
     {{"CUDA", "NVIDIA - CUDA"}, ELF::ELFOSABI_CUDA},
     {{"CUDA", "NVIDIA - CUDA"}, ELF::ELFOSABI_CUDA_V2},
-    {{"Standalone", "Standalone App"}, ELF::ELFOSABI_STANDALONE}};
+    {{"Standalone", "Standalone App"}, ELF::ELFOSABI_STANDALONE},
+    {{"MidnightBSD", "UNIX - MidnightBSD"}, ELF::ELFOSABI_FREEBSD}};
 constexpr auto ElfOSABI = BUILD_ENUM_STRINGS(ElfOSABIDefs);
 
 constexpr EnumStringDef<unsigned, 2> AMDGPUElfOSABIDefs[] = {
