--- src/common.cpp.orig
+++ src/common.cpp
@@ -1059,7 +1059,7 @@
             case L'-':
             case L']':
                 out.push_back('\\');
-                __fallthrough__
+                FISH_FALLTHROUGH
             default:
                 out.push_back(c);
         }
