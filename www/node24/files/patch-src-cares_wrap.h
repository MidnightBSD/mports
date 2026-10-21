--- src/cares_wrap.h.orig	2026-09-08 00:10:03 UTC
+++ src/cares_wrap.h
@@ -24,5 +24,5 @@
 #endif  // __POSIX__
 
-# include <ares_nameser.h>
+# include <arpa/nameser.h>
 
 namespace node {
@@ -340,4 +340,12 @@
       int timeouts,
       struct hostent* host) {
+    Callback(arg, status, timeouts, static_cast<const struct hostent*>(host));
+  }
+
+  static void Callback(
+      void* arg,
+      int status,
+      int timeouts,
+      const struct hostent* host) {
     QueryWrap<Traits>* wrap = FromCallbackPointer(arg);
     if (wrap == nullptr) return;
