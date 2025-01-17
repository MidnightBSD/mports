--- llvm/tools/llvm-readobj/ELFDumper.cpp.orig	2024-03-19 09:11:43.571721000 -0400
+++ llvm/tools/llvm-readobj/ELFDumper.cpp	2024-03-19 09:13:18.618205000 -0400
@@ -1022,7 +1022,8 @@
   {"AROS",         "AROS",                 ELF::ELFOSABI_AROS},
   {"FenixOS",      "FenixOS",              ELF::ELFOSABI_FENIXOS},
   {"CloudABI",     "CloudABI",             ELF::ELFOSABI_CLOUDABI},
-  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE}
+  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE},
+  {"MidnightBSD",  "UNIX - MidnightBSD",   ELF::ELFOSABI_FREEBSD},
 };
 
 const EnumEntry<unsigned> AMDGPUElfOSABI[] = {
@@ -5036,7 +5037,7 @@
     return {"", "", /*IsValid=*/false};
 
   static const char *OSNames[] = {
-      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl",
+      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl", "MidnightBSD"
   };
   StringRef OSName = "Unknown";
   if (Words[0] < array_lengthof(OSNames))
@@ -5587,7 +5588,7 @@
   StringRef Name = Note.getName();
   if (Name == "GNU")
     return FindNote(GNUNoteTypes);
-  if (Name == "FreeBSD") {
+  if (Name == "FreeBSD" || Name == "MidnightBSD") {
     if (ELFType == ELF::ET_CORE) {
       // FreeBSD also places the generic core notes in the FreeBSD namespace.
       StringRef Result = FindNote(FreeBSDCoreNoteTypes);
