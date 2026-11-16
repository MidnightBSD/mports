--- src/parse_util.cpp.orig
+++ src/parse_util.cpp
@@ -377,7 +377,7 @@
                 if (!process) {
                     break;
                 }
-                __fallthrough__
+                FISH_FALLTHROUGH
             }
             case token_type_t::end:
             case token_type_t::background:
