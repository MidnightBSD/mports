--- src/plugins/platforms/xcb/qxcbconnection_basic.h.orig	2020-06-29 10:29:20.300386000 -0400
+++ src/plugins/platforms/xcb/qxcbconnection_basic.h	2020-06-29 10:29:49.937338000 -0400
@@ -163,7 +163,7 @@
 #define Q_XCB_REPLY_CONNECTION_ARG(connection, ...) connection
 
 struct QStdFreeDeleter {
-    void operator()(void *p) const Q_DECL_NOTHROW { return std::free(p); }
+    void operator()(void *p) const Q_DECL_NOTHROW { return free(p); }
 };
 
 #define Q_XCB_REPLY(call, ...) \
