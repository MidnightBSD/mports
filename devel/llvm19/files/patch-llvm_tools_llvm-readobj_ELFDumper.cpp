--- llvm/tools/llvm-readobj/ELFDumper.cpp.orig	2024-06-15 13:21:32.000000000 -0400
+++ llvm/tools/llvm-readobj/ELFDumper.cpp	2025-12-13 13:52:56.695194000 -0500
@@ -1086,6 +1086,7 @@
   {"CloudABI",     "CloudABI",             ELF::ELFOSABI_CLOUDABI},
   {"CUDA",         "NVIDIA - CUDA",        ELF::ELFOSABI_CUDA},
-  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE}
+  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE},
+  {"MidnightBSD",  "UNIX - MidnightBSD",   ELF::ELFOSABI_FREEBSD},
 };
 
 const EnumEntry<unsigned> AMDGPUElfOSABI[] = {
@@ -5284,7 +5285,7 @@
     return {"", "", /*IsValid=*/false};
 
   static const char *OSNames[] = {
-      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl",
+      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl", "MidnightBSD"
   };
   StringRef OSName = "Unknown";
   if (Words[0] < std::size(OSNames))
@@ -5904,7 +5905,7 @@
   StringRef Name = Note.getName();
   if (Name == "GNU")
     return FindNote(GNUNoteTypes);
-  if (Name == "FreeBSD") {
+  if (Name == "FreeBSD" || Name == "MidnightBSD") {
     if (ELFType == ELF::ET_CORE) {
       // FreeBSD also places the generic core notes in the FreeBSD namespace.
       StringRef Result = FindNote(FreeBSDCoreNoteTypes);
