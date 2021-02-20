--- src/plugins/imageformats/jp2/qjp2handler.cpp.orig	2021-02-20 00:53:12.035459000 -0500
+++ src/plugins/imageformats/jp2/qjp2handler.cpp	2021-02-20 00:53:47.343142000 -0500
@@ -44,6 +44,8 @@
 #include "qvariant.h"
 #include "qcolor.h"
 
+#include <cmath>
+
 #include <jasper/jasper.h>
 
 QT_BEGIN_NAMESPACE
