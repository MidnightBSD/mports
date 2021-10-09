--- tools/llvm-readobj/ELFDumper.cpp.orig	2021-10-09 14:46:18.845795000 -0400
+++ tools/llvm-readobj/ELFDumper.cpp	2021-10-09 14:47:10.841718000 -0400
@@ -911,7 +911,8 @@
   {"AROS",         "AROS",                 ELF::ELFOSABI_AROS},
   {"FenixOS",      "FenixOS",              ELF::ELFOSABI_FENIXOS},
   {"CloudABI",     "CloudABI",             ELF::ELFOSABI_CLOUDABI},
-  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE}
+  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE},
+  {"MidnightBSD",  "UNIX - MidnightBSD",   ELF::ELFOSABI_FREEBSD},
 };
 
 static const EnumEntry<unsigned> AMDGPUElfOSABI[] = {
