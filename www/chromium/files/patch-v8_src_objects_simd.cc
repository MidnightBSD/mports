--- v8/src/objects/simd.cc.orig	2026-10-26 21:13:13 UTC
+++ v8/src/objects/simd.cc
@@ -352,7 +352,7 @@
 // __builtin_sve_* on a per-function basis. Clang only supports
 // mangling SVE types with the Microsoft C++ ABI since version 21.
 // Fallback to Neon in cases where SVE is not supported.
-#if defined(NEON64) && defined(__clang__) && \
+#if defined(NEON64) && defined(__clang__) && !defined(V8_TARGET_OS_OPENBSD) && \
     (!defined(V8_TARGET_OS_WIN) || __clang_major__ >= 21)
 #define V8_ENABLE_SIMD_SVE 1
 
