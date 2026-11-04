--- services/plugins/dndcp/stringxx/string.hh.orig	2026-05-29 22:36:17.470070000 -0400
+++ services/plugins/dndcp/stringxx/string.hh	2026-05-29 22:36:30.365112000 -0400
@@ -60,6 +60,70 @@
 #ifdef _WIN32
 #pragma pack(pop)
 #endif // _WIN32
+
+/*
+ * Modern libc++ does not provide char_traits<unsigned short>.
+ * On non-Windows, utf16_t is typedef'd to uint16 (unsigned short),
+ * so we must provide this specialization before utf16string is defined.
+ */
+#ifndef _WIN32
+#include <cstring>
+namespace std {
+template<>
+struct char_traits<unsigned short> {
+   typedef unsigned short  char_type;
+   typedef unsigned int    int_type;
+   typedef std::streamoff  off_type;
+   typedef std::streampos  pos_type;
+   typedef std::mbstate_t  state_type;
+
+   static void assign(char_type& c1, const char_type& c2) noexcept { c1 = c2; }
+   static bool eq(char_type c1, char_type c2) noexcept { return c1 == c2; }
+   static bool lt(char_type c1, char_type c2) noexcept { return c1 < c2; }
+   static int compare(const char_type* s1, const char_type* s2, size_t n) {
+      for (; n; --n, ++s1, ++s2) {
+         if (lt(*s1, *s2)) return -1;
+         if (lt(*s2, *s1)) return  1;
+      }
+      return 0;
+   }
+   static size_t length(const char_type* s) {
+      size_t n = 0;
+      while (*s++) ++n;
+      return n;
+   }
+   static const char_type* find(const char_type* s, size_t n,
+                                const char_type& a) {
+      for (; n; --n, ++s)
+         if (eq(*s, a)) return s;
+      return nullptr;
+   }
+   static char_type* move(char_type* s1, const char_type* s2, size_t n) {
+      return static_cast<char_type*>(memmove(s1, s2, n * sizeof(char_type)));
+   }
+   static char_type* copy(char_type* s1, const char_type* s2, size_t n) {
+      return static_cast<char_type*>(memcpy(s1, s2, n * sizeof(char_type)));
+   }
+   static char_type* assign(char_type* s, size_t n, char_type a) {
+      for (size_t i = 0; i < n; ++i) s[i] = a;
+      return s;
+   }
+   static int_type eof() noexcept { return static_cast<int_type>(-1); }
+   static int_type not_eof(int_type c) noexcept {
+      return eq_int_type(c, eof()) ? 0 : c;
+   }
+   static char_type to_char_type(int_type c) noexcept {
+      return static_cast<char_type>(c);
+   }
+   static int_type to_int_type(char_type c) noexcept {
+      return static_cast<int_type>(c);
+   }
+   static bool eq_int_type(int_type c1, int_type c2) noexcept {
+      return c1 == c2;
+   }
+};
+} // namespace std
+#endif // !_WIN32
 
 #ifdef _WIN32
 #include "ubstr_t.hh"
