--- cargo-crates/v8-149.2.0/third_party/partition_alloc/src/partition_alloc/shim/allocator_shim_override_libc_symbols.h.orig	2026-05-12 00:00:00 UTC
+++ cargo-crates/v8-149.2.0/third_party/partition_alloc/src/partition_alloc/shim/allocator_shim_override_libc_symbols.h
@@ -27,6 +27,12 @@

 extern "C" {

+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+#define PA_SHIM_LIBC_THROW
+#else
+#define PA_SHIM_LIBC_THROW __THROW
+#endif
+
 // WARNING: Whenever a new function is added there (which, surprisingly enough,
 // happens. For instance glibc 2.33 introduced mallinfo2(), which we don't
 // support... yet?), it MUST be added to build/linux/chrome.map.
@@ -36,54 +42,59 @@ extern "C" {
 // intercept calls made by dynamic libraries. See crbug.com/1292206 for such
 // an example.

-SHIM_ALWAYS_EXPORT void* malloc(size_t size) __THROW {
+SHIM_ALWAYS_EXPORT void* malloc(size_t size) PA_SHIM_LIBC_THROW {
   return ShimMalloc(size, nullptr);
 }

-SHIM_ALWAYS_EXPORT void free(void* ptr) __THROW {
+SHIM_ALWAYS_EXPORT void free(void* ptr) PA_SHIM_LIBC_THROW {
   ShimFree(ptr, nullptr);
 }

-SHIM_ALWAYS_EXPORT void* realloc(void* ptr, size_t size) __THROW {
+SHIM_ALWAYS_EXPORT void* realloc(void* ptr, size_t size) PA_SHIM_LIBC_THROW {
   return ShimRealloc(ptr, size, nullptr);
 }

-SHIM_ALWAYS_EXPORT void* calloc(size_t n, size_t size) __THROW {
+SHIM_ALWAYS_EXPORT void* calloc(size_t n, size_t size) PA_SHIM_LIBC_THROW {
   return ShimCalloc(n, size, nullptr);
 }

-SHIM_ALWAYS_EXPORT void cfree(void* ptr) __THROW {
+SHIM_ALWAYS_EXPORT void cfree(void* ptr) PA_SHIM_LIBC_THROW {
   ShimFree(ptr, nullptr);
 }

-SHIM_ALWAYS_EXPORT void* memalign(size_t align, size_t s) __THROW {
+SHIM_ALWAYS_EXPORT void* memalign(size_t align, size_t s) PA_SHIM_LIBC_THROW {
   return ShimMemalign(align, s, nullptr);
 }

-SHIM_ALWAYS_EXPORT void* aligned_alloc(size_t align, size_t s) __THROW {
+SHIM_ALWAYS_EXPORT void* aligned_alloc(size_t align, size_t s)
+    PA_SHIM_LIBC_THROW {
   return ShimMemalign(align, s, nullptr);
 }

-SHIM_ALWAYS_EXPORT void* valloc(size_t size) __THROW {
+SHIM_ALWAYS_EXPORT void* valloc(size_t size) PA_SHIM_LIBC_THROW {
   return ShimValloc(size, nullptr);
 }

-SHIM_ALWAYS_EXPORT void* pvalloc(size_t size) __THROW {
+SHIM_ALWAYS_EXPORT void* pvalloc(size_t size) PA_SHIM_LIBC_THROW {
   return ShimPvalloc(size);
 }

-SHIM_ALWAYS_EXPORT int posix_memalign(void** r, size_t a, size_t s) __THROW {
+SHIM_ALWAYS_EXPORT int posix_memalign(void** r, size_t a, size_t s)
+    PA_SHIM_LIBC_THROW {
   return ShimPosixMemalign(r, a, s);
 }

-SHIM_ALWAYS_EXPORT size_t malloc_size(const void* address) __THROW {
+SHIM_ALWAYS_EXPORT size_t malloc_size(const void* address) PA_SHIM_LIBC_THROW {
   return ShimGetSizeEstimate(address, nullptr);
 }

-SHIM_ALWAYS_EXPORT size_t malloc_usable_size(void* address) __THROW {
+SHIM_ALWAYS_EXPORT size_t malloc_usable_size(const void* address)
+    PA_SHIM_LIBC_THROW {
   return ShimGetSizeEstimate(address, nullptr);
 }

+#undef PA_SHIM_LIBC_THROW
+
 // The default dispatch translation unit has to define also the following
 // symbols (unless they are ultimately routed to the system symbols):
 //   void malloc_stats(void);
