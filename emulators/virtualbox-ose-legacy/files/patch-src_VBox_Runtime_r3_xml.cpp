--- src/VBox/Runtime/r3/xml.cpp.orig
+++ src/VBox/Runtime/r3/xml.cpp
@@ -1838,8 +1838,16 @@
 }
 
+#if LIBXML_VERSION >= 21206
+static void xmlStructuredErrorFunc(void *userData, const xmlError *error)
+{
+    NOREF(userData);
+    NOREF(error);
+}
+#else
 static void xmlParserBaseStructuredError(void *pCtx, xmlErrorPtr error)
 {
     NOREF(pCtx);
     /* we expect that there is always a trailing NL */
     LogRel(("XML error at '%s' line %d: %s", error->file, error->line, error->message));
 }
+#endif
@@ -1853,2 +1861,6 @@
     xmlSetGenericErrorFunc(NULL, xmlParserBaseGenericError);
+#if LIBXML_VERSION >= 21206
+    xmlSetStructuredErrorFunc(NULL, xmlStructuredErrorFunc);
+#else
     xmlSetStructuredErrorFunc(NULL, xmlParserBaseStructuredError);
+#endif
@@ -1915,1 +1927,1 @@
-        throw XmlError(xmlCtxtGetLastError(m_ctxt));
+        throw XmlError((xmlErrorPtr)xmlCtxtGetLastError(m_ctxt));
@@ -2175,1 +2187,1 @@
-        throw XmlError(xmlCtxtGetLastError(m_ctxt));
+        throw XmlError((xmlErrorPtr)xmlCtxtGetLastError(m_ctxt));
