--- llvm/tools/llvm-readobj/ELFDumper.cpp.orig	2023-12-19 23:04:19.011226000 -0500
+++ llvm/tools/llvm-readobj/ELFDumper.cpp	2023-12-19 23:05:24.960544000 -0500
@@ -983,7 +983,8 @@
   {"AROS",         "AROS",                 ELF::ELFOSABI_AROS},
   {"FenixOS",      "FenixOS",              ELF::ELFOSABI_FENIXOS},
   {"CloudABI",     "CloudABI",             ELF::ELFOSABI_CLOUDABI},
-  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE}
+  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE},
+  {"MidnightBSD",      "UNIX - MidnightBSD",       ELF::ELFOSABI_FREEBSD},
 };
 
 static const EnumEntry<unsigned> AMDGPUElfOSABI[] = {
@@ -4852,7 +4853,7 @@
     return {"", "", /*IsValid=*/false};
 
   static const char *OSNames[] = {
-      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl",
+      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl", "MidnightBSD"
   };
   StringRef OSName = "Unknown";
   if (Words[0] < array_lengthof(OSNames))
@@ -5154,7 +5155,7 @@
   StringRef Name = Note.getName();
   if (Name == "GNU")
     return FindNote(GNUNoteTypes);
-  if (Name == "FreeBSD")
+  if (Name == "FreeBSD" || Name == "MidnightBSD")
     return FindNote(FreeBSDNoteTypes);
   if (Name == "AMD")
     return FindNote(AMDNoteTypes);
