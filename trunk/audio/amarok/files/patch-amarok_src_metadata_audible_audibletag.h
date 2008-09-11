
$FreeBSD: ports/audio/amarok/files/patch-amarok_src_metadata_audible_audibletag.h,v 1.1 2006/07/03 14:44:38 mich Exp $

--- amarok/src/metadata/audible/audibletag.h.orig
+++ amarok/src/metadata/audible/audibletag.h
@@ -9,6 +9,8 @@
 
 #include <config.h>
 
+#include <stdio.h>
+#include <sys/types.h>
 #include <taglib/tag.h>
 #include "taglib_audiblefile.h"
 
