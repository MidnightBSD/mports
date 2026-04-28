--- src/xml.c.orig	2009-06-24 12:27:39 UTC
+++ src/xml.c
@@ -104,6 +104,6 @@
 static ErrorInfo errorInfo = { NULL, NULL, VERBOSE, CONTINUE };
 
-void reportError(void *ptr, xmlErrorPtr error)
+void reportError(void *ptr, const xmlError *error)
 {
     ErrorInfo *errorInfo = (ErrorInfo*) ptr;
     assert(errorInfo);
@@ -125,20 +125,24 @@
         {
             fprintf(stderr, "%s:%d.%d: ", filename, line, column);
         }
 
-        msglen = strlen(error->message);
-        if (error->message[msglen-1] == '\n')
-            error->message[msglen-1] = '\0';
-        fprintf(stderr, "%s", error->message);
+        /* libxml2 now passes a const xmlError; don't mutate its message. */
+        if (error->message) {
+            msglen = strlen(error->message);
+            if (msglen > 0 && error->message[msglen - 1] == '\n') {
+                msglen--;
+            }
+            fprintf(stderr, "%.*s", (int)msglen, error->message);
+        }
 
         /* only print extra info if it's not in message */
         if (error->str1 && strstr(error->message, error->str1) == NULL) {
             fprintf(stderr, ": %s", error->str1);
             if (error->str2 && strstr(error->message, error->str2) == NULL) {
                 fprintf(stderr, ", %s", error->str2);
             }
             if (error->str3 && strstr(error->message, error->str3) == NULL) {
                 fprintf(stderr, ", %s", error->str3);
             }
         }
         fprintf(stderr, "\n");
