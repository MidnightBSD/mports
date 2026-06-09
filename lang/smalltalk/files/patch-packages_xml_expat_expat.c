--- packages/xml/expat/expat.c.orig	2013-06-01 18:53:58 UTC
+++ packages/xml/expat/expat.c
@@ -479,7 +479,9 @@ gst_EndNamespaceDeclHandler (void *userData,
 static void
 gst_SkippedEntityHandler (void *userData,
-			  const XML_Char * entityName)
+			  const XML_Char * entityName,
+			  int is_parameter_entity)
 {
+  (void) is_parameter_entity;
   XML_Parser p = userData;
   OOP parserOOP = XML_GetUserData (p);
   make_event (parserOOP,
