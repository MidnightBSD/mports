--- src/svgint.h.orig	2004-02-22 20:31:06 UTC
+++ src/svgint.h
@@ -21,6 +21,8 @@
 #ifndef SVGINT_H
 #define SVGINT_H
 
+#include <stdlib.h>
+
 #ifdef LIBSVG_EXPAT
 
 #include <expat.h>
@@ -33,6 +35,7 @@ typedef XML_Parser svg_xml_parser_contex
 #else
 
 #include <libxml/SAX.h>
+#include <libxml/parser.h>
 #include <libxml/xmlmemory.h>
 #include <libxml/hash.h>
 
