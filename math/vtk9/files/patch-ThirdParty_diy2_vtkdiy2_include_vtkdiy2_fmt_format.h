Bundled fmt 6.0 instantiates std::char_traits for its fallback char8_t enum,
which libc++ 19 no longer provides. Compute the length with std::strlen
instead, as later fmt releases do.

--- ThirdParty/diy2/vtkdiy2/include/vtkdiy2/fmt/format.h.orig	2023-05-16 15:04:51 UTC
+++ ThirdParty/diy2/vtkdiy2/include/vtkdiy2/fmt/format.h
@@ -484,7 +484,8 @@ void basic_memory_buffer<T, SIZE, Allocator>::grow(std
 class u8string_view : public basic_string_view<char8_t> {
  public:
   u8string_view(const char* s)
-      : basic_string_view<char8_t>(reinterpret_cast<const char8_t*>(s)) {}
+      : basic_string_view<char8_t>(reinterpret_cast<const char8_t*>(s),
+                                   std::strlen(s)) {}
   u8string_view(const char* s, size_t count) FMT_NOEXCEPT
       : basic_string_view<char8_t>(reinterpret_cast<const char8_t*>(s), count) {
   }
