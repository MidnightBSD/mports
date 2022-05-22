--- tools/llvm-readobj/ELFDumper.cpp.orig	2019-01-08 05:58:05.000000000 -0500
+++ tools/llvm-readobj/ELFDumper.cpp	2021-10-09 15:09:32.356900000 -0400
@@ -911,7 +911,8 @@
   {"AROS",         "AROS",                 ELF::ELFOSABI_AROS},
   {"FenixOS",      "FenixOS",              ELF::ELFOSABI_FENIXOS},
   {"CloudABI",     "CloudABI",             ELF::ELFOSABI_CLOUDABI},
-  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE}
+  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE},
+  {"MidnightBSD",  "UNIX - MidnightBSD",   ELF::ELFOSABI_FREEBSD},
 };
 
 static const EnumEntry<unsigned> AMDGPUElfOSABI[] = {
@@ -3781,7 +3782,7 @@
     return {"", "", /*IsValid=*/false};
 
   static const char *OSNames[] = {
-      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl",
+      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl", "MidnightBSD"
   };
   StringRef OSName = "Unknown";
   if (Words[0] < array_lengthof(OSNames))
@@ -3925,7 +3926,7 @@
     if (Name == "GNU") {
       OS << getGNUNoteTypeName(Type) << '\n';
       printGNUNote<ELFT>(OS, Type, Descriptor);
-    } else if (Name == "FreeBSD") {
+    } else if (Name == "FreeBSD" || Name == "MidnightBSD") {
       OS << getFreeBSDNoteTypeName(Type) << '\n';
     } else if (Name == "AMD") {
       OS << getAMDNoteTypeName(Type) << '\n';
@@ -4596,7 +4597,7 @@
     if (Name == "GNU") {
       W.printString("Type", getGNUNoteTypeName(Type));
       printGNUNoteLLVMStyle<ELFT>(Type, Descriptor, W);
-    } else if (Name == "FreeBSD") {
+    } else if (Name == "FreeBSD" || Name == "MidnightBSD") {
       W.printString("Type", getFreeBSDNoteTypeName(Type));
     } else if (Name == "AMD") {
       W.printString("Type", getAMDNoteTypeName(Type));
