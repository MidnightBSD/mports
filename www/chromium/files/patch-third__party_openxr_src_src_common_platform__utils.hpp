--- third_party/openxr/src/src/common/platform_utils.hpp.orig	2026-10-26 21:13:13 UTC
+++ third_party/openxr/src/src/common/platform_utils.hpp	2026-10-29 11:54:51 UTC
@@ -95,7 +95,9 @@
 
 // clang-format off
 static inline char* ImplGetSecureEnv(const char* name) {
-#ifdef HAVE_SECURE_GETENV
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+    return issetugid() ? nullptr : ImplGetEnv(name);
+#elif defined(HAVE_SECURE_GETENV)
     return secure_getenv(name);
 #elif defined(HAVE___SECURE_GETENV)
     return __secure_getenv(name);
