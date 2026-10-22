--- src/cares_wrap.h.orig	2026-10-20 12:00:00 UTC
+++ src/cares_wrap.h
@@ -23,7 +23,7 @@
 # include <netdb.h>
 #endif  // __POSIX__
 
-# include <ares_nameser.h>
+# include <arpa/nameser.h>
 
 namespace node {
 namespace cares_wrap {
@@ -339,5 +339,13 @@
       int status,
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
