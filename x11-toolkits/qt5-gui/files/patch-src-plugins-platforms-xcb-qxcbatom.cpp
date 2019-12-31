--- ./src/plugins/platforms/xcb/qxcbatom.cpp.orig	2019-10-05 19:50:26.498312000 -0400
+++ ./src/plugins/platforms/xcb/qxcbatom.cpp	2019-10-05 19:50:41.413546000 -0400
@@ -41,6 +41,7 @@
 #include <QtCore/qglobal.h>
 
 #include <string.h>
+#include <cstdlib>
 
 #include <algorithm>
 
