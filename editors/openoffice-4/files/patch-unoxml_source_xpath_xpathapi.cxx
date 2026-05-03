--- unoxml/source/xpath/xpathapi.cxx.orig	2014-01-01 00:00:00.000000000 +0000
+++ unoxml/source/xpath/xpathapi.cxx	2026-05-02 00:00:00.000000000 +0000
@@ -267,7 +267,7 @@
     }
 
-    static OUString make_error_message(xmlErrorPtr pError)
+    static OUString make_error_message(const xmlError * pError)
     {
         ::rtl::OUStringBuffer buf;
         if (pError->message) {
@@ -312,7 +312,7 @@
 
-        static void structured_error_func(void * userData, xmlErrorPtr error)
+        static void structured_error_func(void * userData, const xmlError * error)
         {
             (void) userData;
             ::rtl::OUStringBuffer buf(
