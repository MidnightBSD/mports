--- src/expand.cpp.orig
+++ src/expand.cpp
@@ -973,7 +973,7 @@
                 return expand_result_t::ok;
             case 1:
                 append_cmdsub_error(errors, start, end, L"command substitutions not allowed here");
-                __fallthrough__
+                FISH_FALLTHROUGH
             case -1:
             default:
                 return expand_result_t::make_error(STATUS_EXPAND_ERROR);
