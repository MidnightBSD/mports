--- tools/llvm-readobj/ELFDumper.cpp.orig	2020-07-07 12:21:37.000000000 -0400
+++ tools/llvm-readobj/ELFDumper.cpp	2022-06-11 08:02:28.267534000 -0400
@@ -1223,7 +1223,8 @@
   {"AROS",         "AROS",                 ELF::ELFOSABI_AROS},
   {"FenixOS",      "FenixOS",              ELF::ELFOSABI_FENIXOS},
   {"CloudABI",     "CloudABI",             ELF::ELFOSABI_CLOUDABI},
-  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE}
+  {"Standalone",   "Standalone App",       ELF::ELFOSABI_STANDALONE},
+  {"MidnightBSD",  "UNIX - MidnightBSD",   ELF::ELFOSABI_FREEBSD},
 };
 
 static const EnumEntry<unsigned> SymVersionFlags[] = {
@@ -4704,7 +4705,7 @@
     return {"", "", /*IsValid=*/false};
 
   static const char *OSNames[] = {
-      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl",
+      "Linux", "Hurd", "Solaris", "FreeBSD", "NetBSD", "Syllable", "NaCl", "MidnightBSD"
   };
   StringRef OSName = "Unknown";
   if (Words[0] < array_lengthof(OSNames))
@@ -4900,7 +4901,7 @@
        << format_hex(Descriptor.size(), 10) << '\t';
     if (Name == "GNU") {
       OS << getGNUNoteTypeName(Type) << '\n';
-    } else if (Name == "FreeBSD") {
+    } else if (Name == "FreeBSD" || Name == "MidnightBSD") {
       OS << getFreeBSDNoteTypeName(Type) << '\n';
     } else if (Name == "AMD") {
       OS << getAMDNoteTypeName(Type) << '\n';
@@ -6113,7 +6114,7 @@
     W.printHex("Data size", Descriptor.size());
     if (Name == "GNU") {
       W.printString("Type", getGNUNoteTypeName(Type));
-    } else if (Name == "FreeBSD") {
+    } else if (Name == "FreeBSD" || Name == "MidnightBSD") {
       W.printString("Type", getFreeBSDNoteTypeName(Type));
     } else if (Name == "AMD") {
       W.printString("Type", getAMDNoteTypeName(Type));
