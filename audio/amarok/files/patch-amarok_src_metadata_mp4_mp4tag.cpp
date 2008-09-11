
$FreeBSD: ports/audio/amarok/files/patch-amarok_src_metadata_mp4_mp4tag.cpp,v 1.1 2006/07/03 14:44:38 mich Exp $

--- amarok/src/metadata/mp4/mp4tag.cpp.orig
+++ amarok/src/metadata/mp4/mp4tag.cpp
@@ -23,7 +23,7 @@
 #include "mp4tag.h"
 
 #include <tag.h>
-#include <stdint.h>
+#include <inttypes.h>
 
 using namespace TagLib;
 
