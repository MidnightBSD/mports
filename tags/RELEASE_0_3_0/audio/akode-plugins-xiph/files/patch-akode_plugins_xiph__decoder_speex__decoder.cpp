
$FreeBSD: ports/audio/akode-plugins-xiph/files/patch-akode_plugins_xiph__decoder_speex__decoder.cpp,v 1.6 2008/08/29 11:29:42 miwi Exp $

--- akode/plugins/xiph_decoder/speex_decoder.cpp.orig
+++ akode/plugins/xiph_decoder/speex_decoder.cpp
@@ -25,10 +25,10 @@
 extern "C" {
 #include <string.h>
 #include <stdlib.h>
-#include <speex.h>
-#include <speex_header.h>
-#include <speex_callbacks.h>
-#include <speex_stereo.h>
+#include <speex/speex.h>
+#include <speex/speex_header.h>
+#include <speex/speex_callbacks.h>
+#include <speex/speex_stereo.h>
 #include <ogg/ogg.h>
 }
 
