--- third_party/boringssl-with-bazel/src/include/openssl/base.h.orig	2025-04-25 00:00:00 UTC
+++ third_party/boringssl-with-bazel/src/include/openssl/base.h
@@ -392,9 +392,6 @@
 // MSVC doesn't set __cplusplus to 201103 to indicate C++11 support (see
 // https://connect.microsoft.com/VisualStudio/feedback/details/763051/a-value-of-predefined-macro-cplusplus-is-still-199711l)
 // so MSVC is just assumed to support C++11.
-#if !defined(BORINGSSL_NO_CXX) && __cplusplus < 201103L && !defined(_MSC_VER)
-#define BORINGSSL_NO_CXX
-#endif

 #if !defined(BORINGSSL_NO_CXX)
