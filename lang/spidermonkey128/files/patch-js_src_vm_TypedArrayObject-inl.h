--- js/src/vm/TypedArrayObject-inl.h.orig	2025-08-18 20:29:39 UTC
+++ js/src/vm/TypedArrayObject-inl.h
@@ -404,7 +404,7 @@ class ElementSpecific {
-    // `malloc` returns memory at least as strictly aligned as for max_align_t
-    // and the alignment of max_align_t is a multiple of the size of `T`,
-    // so `SharedMem::cast` will be called with properly aligned memory.
-    static_assert(alignof(std::max_align_t) % sizeof(T) == 0);
+    // ArrayBuffer data is aligned to ARRAY_BUFFER_ALIGNMENT, which is a
+    // multiple of the size of `T`, so `SharedMem::cast` will be called with
+    // properly aligned memory.
+    static_assert(ArrayBufferObject::ARRAY_BUFFER_ALIGNMENT % sizeof(T) == 0);
