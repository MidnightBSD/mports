--- src/btop_input.hpp.orig	2025-05-24 18:07:27 UTC
+++ src/btop_input.hpp
@@ -24,6 +24,7 @@ tab-size = 4
 #include <string>
 #include <string_view>
 #include <unordered_map>
+#include <poll.h>
 
 using std::array;
 using std::atomic;
