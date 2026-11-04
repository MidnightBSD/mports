--- include/rapidjson/writer.h.orig	2023-10-19 08:04:27 UTC
+++ include/rapidjson/writer.h
@@ -210,3 +210,4 @@ public:
 #if RAPIDJSON_HAS_STDSTRING
-    bool String(const std::basic_string<Ch>& str) {
+    template <typename T>
+    bool String(const std::basic_string<T>& str, RAPIDJSON_ENABLEIF((internal::IsSame<T, Ch>))) {
         return String(str.data(), SizeType(str.size()));
@@ -223,3 +224,4 @@ public:
 #if RAPIDJSON_HAS_STDSTRING
-    bool Key(const std::basic_string<Ch>& str)
+    template <typename T>
+    bool Key(const std::basic_string<T>& str, RAPIDJSON_ENABLEIF((internal::IsSame<T, Ch>)))
     {
