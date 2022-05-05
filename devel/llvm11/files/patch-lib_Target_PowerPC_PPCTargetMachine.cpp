--- lib/Target/PowerPC/PPCTargetMachine.cpp.orig	2020-12-18 19:57:38 UTC
+++ lib/Target/PowerPC/PPCTargetMachine.cpp
@@ -212,6 +212,20 @@ static PPCTargetMachine::PPCABI computeT
   if (TT.isMacOSX())
     return PPCTargetMachine::PPC_ABI_UNKNOWN;
 
+  if (TT.isOSFreeBSD()) {
+    switch (TT.getArch()) {
+    case Triple::ppc64le:
+    case Triple::ppc64:
+      if (TT.getOSMajorVersion() >= 13)
+        return PPCTargetMachine::PPC_ABI_ELFv2;
+      else
+        return PPCTargetMachine::PPC_ABI_ELFv1;
+    case Triple::ppc:
+    default:
+      return PPCTargetMachine::PPC_ABI_UNKNOWN;
+    }
+  }
+
   switch (TT.getArch()) {
   case Triple::ppc64le:
     return PPCTargetMachine::PPC_ABI_ELFv2;
