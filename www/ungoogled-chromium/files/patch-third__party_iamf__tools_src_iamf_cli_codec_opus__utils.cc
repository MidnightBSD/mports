--- third_party/iamf_tools/src/iamf/cli/codec/opus_utils.cc.orig	2026-10-26 21:13:13 UTC
+++ third_party/iamf_tools/src/iamf/cli/codec/opus_utils.cc	2026-10-29 04:40:20 UTC
@@ -14,7 +14,7 @@
 #include "absl/status/status.h"
 #include "absl/strings/str_cat.h"
 #include "absl/strings/string_view.h"
-#include "include/opus_defines.h"
+#include "third_party/opus/src/include/opus_defines.h"
 
 namespace iamf_tools {
 
