
$FreeBSD: ports/audio/amarok/files/patch-amarok_src_metadata_mp4_mp4tag.cpp,v 1.2 2009/08/02 19:32:11 mezz Exp $

--- amarok/src/metadata/mp4/mp4tag.cpp.orig
+++ amarok/src/metadata/mp4/mp4tag.cpp
@@ -23,7 +23,7 @@
 #include "mp4tag.h"
 
 #include <tag.h>
-#include <stdint.h>
+#include <inttypes.h>
 
 using namespace TagLib;
 
