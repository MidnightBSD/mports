--- rules.h.orig	2025-08-19 14:01:47 UTC
+++ rules.h
@@ -34,6 +34,7 @@ enum BlockType {
 	BLOCK_MAINTAINER,	// human:"Maintainer block"
 	BLOCK_LICENSE,		// human:"License block"
 	BLOCK_LICENSE_OLD,	// human:"Old-school license block (please replace with LICENSE)"
+	BLOCK_FAKE,		// human:"Fake"
 	BLOCK_BROKEN,		// human:"BROKEN/IGNORE/DEPRECATED messages"
 	BLOCK_DEPENDS,		// human:"Dependencies"
 	BLOCK_FLAVORS,		// human:"Flavors"
