--- src/plugins/platforms/xcb/qxcbconnection_basic.h.orig	2019-03-06 02:59:50.000000000 -0500
+++ src/plugins/platforms/xcb/qxcbconnection_basic.h	2019-10-05 19:21:16.098470000 -0400
@@ -50,6 +50,7 @@
 #include <xcb/xcb.h>
 
 #include <memory>
+#include <cstdlib>
 
 QT_BEGIN_NAMESPACE
 
@@ -157,7 +158,7 @@
 #define Q_XCB_REPLY_CONNECTION_ARG(connection, ...) connection
 
 struct QStdFreeDeleter {
-    void operator()(void *p) const Q_DECL_NOTHROW { return std::free(p); }
+    void operator()(void *p) const Q_DECL_NOTHROW { return free(p); }
 };
 
 #define Q_XCB_REPLY(call, ...) \
