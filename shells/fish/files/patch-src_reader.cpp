--- src/reader.cpp.orig
+++ src/reader.cpp
@@ -3535,7 +3535,7 @@
                 break;
             }
             // Else we repaint as normal.
-            __fallthrough__
+            FISH_FALLTHROUGH
         }
         case rl::force_repaint:
         case rl::repaint: {
