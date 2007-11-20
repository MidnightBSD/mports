
$FreeBSD: ports/audio/flac/files/patch-src_libFLAC_include_private_md5.h,v 1.1 2007/11/13 14:28:28 naddy Exp $

--- src/libFLAC/include/private/md5.h.orig
+++ src/libFLAC/include/private/md5.h
@@ -41,7 +41,7 @@
 	FLAC__uint32 bytes[2];
 	FLAC__uint32 in[16];
 	FLAC__byte *internal_buf;
-	unsigned capacity;
+	size_t capacity;
 };
 
 FLAC_API void FLAC__MD5Init(struct FLAC__MD5Context *context);
