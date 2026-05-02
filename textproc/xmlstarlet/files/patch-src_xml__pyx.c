--- src/xml_pyx.c.orig	2009-06-24 12:27:39 UTC
+++ src/xml_pyx.c
@@ -19,6 +19,15 @@
 #include <libxml/parser.h>
 #include <libxml/parserInternals.h>
 
 #include "xmlstar.h"
+
+/* libxml2 no longer provides ATTRIBUTE_UNUSED; keep older source building. */
+#ifndef ATTRIBUTE_UNUSED
+#  if defined(__GNUC__) || defined(__clang__)
+#    define ATTRIBUTE_UNUSED __attribute__((unused))
+#  else
+#    define ATTRIBUTE_UNUSED
+#  endif
+#endif
 
 /**
  *  Output newline and tab characters as escapes
  *  Required both for attribute values and character data (#PCDATA)
