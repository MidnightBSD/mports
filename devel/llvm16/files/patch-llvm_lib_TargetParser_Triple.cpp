--- llvm/lib/TargetParser/Triple.cpp.orig	2025-03-09 16:09:45.292468000 -0400
+++ llvm/lib/TargetParser/Triple.cpp	2025-03-09 16:10:07.114281000 -0400
@@ -218,6 +218,7 @@
   case ELFIAMCU: return "elfiamcu";
   case Emscripten: return "emscripten";
   case FreeBSD: return "freebsd";
+  case MidnightBSD: return "freebsd";
   case Fuchsia: return "fuchsia";
   case Haiku: return "haiku";
   case HermitCore: return "hermit";
