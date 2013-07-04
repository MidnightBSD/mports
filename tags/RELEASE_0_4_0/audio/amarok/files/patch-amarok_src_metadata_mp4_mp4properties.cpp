
$FreeBSD: ports/audio/amarok/files/patch-amarok_src_metadata_mp4_mp4properties.cpp,v 1.2 2009/08/02 19:32:11 mezz Exp $

--- amarok/src/metadata/mp4/mp4properties.cpp.orig
+++ amarok/src/metadata/mp4/mp4properties.cpp
@@ -29,7 +29,7 @@
 #include <systems.h>
 #endif
 
-#include <stdint.h>
+#include <inttypes.h>
 
 using namespace TagLib;
 
