    disable linux-only code in crashreporter on FreeBSD

--- toolkit/crashreporter/google-breakpad/src/common/linux/memory_mapped_file.cc.orig	2025-06-01 18:00:00 UTC
+++ toolkit/crashreporter/google-breakpad/src/common/linux/memory_mapped_file.cc
@@ -59,6 +59,9 @@ MemoryMappedFile::~MemoryMappedFile() {

 bool MemoryMappedFile::Map(const char* path, size_t offset) {
   Unmap();
+#if defined(__FreeBSD__)
+    return false;
+#else

   int fd = sys_open(path, O_RDONLY, 0);
   if (fd == -1) {
@@ -100,10 +103,13 @@ bool MemoryMappedFile::Map(const char* path, size_t offset) {

   content_.Set(data, file_len - offset);
   return true;
+#endif
 }

 void MemoryMappedFile::Unmap() {
+#if !defined(__FreeBSD__)
   if (content_.data()) {
     sys_munmap(const_cast<uint8_t*>(content_.data()), content_.length());
     content_.Set(NULL, 0);
   }
+#endif
 }

 }  // namespace google_breakpad
