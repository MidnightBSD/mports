--- include/rapidjson/prettywriter.h.orig	2023-10-19 08:04:27 UTC
+++ include/rapidjson/prettywriter.h
@@ -116,3 +116,4 @@ public:
 #if RAPIDJSON_HAS_STDSTRING
-    bool String(const std::basic_string<Ch>& str) {
+    template <typename T>
+    bool String(const std::basic_string<T>& str, RAPIDJSON_ENABLEIF((internal::IsSame<T, Ch>))) {
         return String(str.data(), SizeType(str.size()));
@@ -129,3 +130,4 @@ public:
 #if RAPIDJSON_HAS_STDSTRING
-    bool Key(const std::basic_string<Ch>& str) {
+    template <typename T>
+    bool Key(const std::basic_string<T>& str, RAPIDJSON_ENABLEIF((internal::IsSame<T, Ch>))) {
         return Key(str.data(), SizeType(str.size()));
