--- llvm/tools/llvm-objcopy/ObjcopyOptions.cpp.orig	2024-03-19 09:07:42.167293000 -0400
+++ llvm/tools/llvm-objcopy/ObjcopyOptions.cpp	2024-03-19 09:08:52.005298000 -0400
@@ -322,13 +322,14 @@
 getOutputTargetInfoByTargetName(StringRef TargetName) {
   StringRef OriginalTargetName = TargetName;
   bool IsFreeBSD = TargetName.consume_back("-freebsd");
+  bool IsMidnightBSD = TargetName.consume_back("-midnightbsd");
   auto Iter = TargetMap.find(TargetName);
   if (Iter == std::end(TargetMap))
     return createStringError(errc::invalid_argument,
                              "invalid output format: '%s'",
                              OriginalTargetName.str().c_str());
   MachineInfo MI = Iter->getValue();
-  if (IsFreeBSD)
+  if (IsFreeBSD || IsMidnightBSD)
     MI.OSABI = ELF::ELFOSABI_FREEBSD;
 
   FileFormat Format;
