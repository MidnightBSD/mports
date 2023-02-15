--- libclamav/dmg.c.orig	2022-07-26 02:15:53 UTC
+++ libclamav/dmg.c
@@ -206,8 +206,7 @@ int cli_scandmg(cli_ctx *ctx)
 /* This is the block where we require libxml2 */
 #if HAVE_LIBXML2
 
-/* XML_PARSE_NOENT | XML_PARSE_NONET | XML_PARSE_COMPACT */
-#define DMG_XML_PARSE_OPTS ((1 << 1 | 1 << 11 | 1 << 16) | CLAMAV_MIN_XMLREADER_FLAGS)
+#define DMG_XML_PARSE_OPTS ((XML_PARSE_NONET | XML_PARSE_COMPACT) | CLAMAV_MIN_XMLREADER_FLAGS)
 
     reader = xmlReaderForMemory(outdata, (int)hdr.xmlLength, "toc.xml", NULL, DMG_XML_PARSE_OPTS);
     if (!reader) {
