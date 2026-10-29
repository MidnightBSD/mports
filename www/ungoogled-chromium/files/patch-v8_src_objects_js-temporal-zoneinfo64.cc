--- v8/src/objects/js-temporal-zoneinfo64.cc.orig	2026-10-26 21:13:13 UTC
+++ v8/src/objects/js-temporal-zoneinfo64.cc
@@ -13,7 +13,7 @@
 #ifdef V8_INTL_SUPPORT
 #ifndef V8_ENABLE_TEMPORAL_SYSTEMICU
 // ICU internal header file
-#include "udatamem.h"
+#include "../../third_party/icu/source/common/udatamem.h"
 #else
 /**
  * Shadow definition of UDataMemory
