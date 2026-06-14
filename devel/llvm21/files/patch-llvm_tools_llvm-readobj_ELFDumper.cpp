--- llvm/tools/llvm-readobj/ELFDumper.cpp.orig	2025-01-14 04:41:02.000000000 -0500
+++ llvm/tools/llvm-readobj/ELFDumper.cpp	2026-05-05 00:00:00.000000000 -0400
@@ -1101,7 +1101,8 @@
     {"CloudABI", "CloudABI", ELF::ELFOSABI_CLOUDABI},
     {"CUDA", "NVIDIA - CUDA", ELF::ELFOSABI_CUDA},
     {"CUDA", "NVIDIA - CUDA", ELF::ELFOSABI_CUDA_V2},
-    {"Standalone", "Standalone App", ELF::ELFOSABI_STANDALONE}};
+    {"Standalone", "Standalone App", ELF::ELFOSABI_STANDALONE},
+    {"MidnightBSD",  "UNIX - MidnightBSD",   ELF::ELFOSABI_FREEBSD}};
