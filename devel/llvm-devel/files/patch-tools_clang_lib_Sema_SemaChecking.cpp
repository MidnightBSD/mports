
$FreeBSD: ports/devel/llvm-devel/files/patch-tools_clang_lib_Sema_SemaChecking.cpp,v 1.4 2009/09/27 21:43:25 brooks Exp $

--- tools/clang/lib/Sema/SemaChecking.cpp.orig
+++ tools/clang/lib/Sema/SemaChecking.cpp
@@ -1120,7 +1120,6 @@
     case 'u':
     case 'x':
     case 'X':
-    case 'D':
     case 'O':
     case 'U':
     case 'e':
@@ -1136,9 +1135,16 @@
     case 'S':
     case 's':
     case 'p':
+    case 'r':                                                 
+    case 'y': 
       ++numConversions;
       CurrentState = state_OrdChr;
       break;
+   case 'b':                                                 
+   case 'D':                                                 
+     numConversions += 2;                                    
+     CurrentState = state_OrdChr;                            
+     break;
 
     case 'm':
       // FIXME: Warn in situations where this isn't supported!
