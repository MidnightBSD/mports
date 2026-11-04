CVE-2025-40907 / CVE-2025-23016: validate FastCGI parameter lengths.

Backport upstream fixes:
https://github.com/FastCGI-Archives/fcgi2/commit/b0eabcaf4d4f371514891a52115c746815c2ff15
https://github.com/FastCGI-Archives/fcgi2/commit/7c476394e799f39f749d7a7a50f62e5d3ec8db61

--- fcgiapp.c.orig	2021-07-31 03:25:35 UTC
+++ fcgiapp.c
@@ -21,6 +21,7 @@
 #include <memory.h>     /* for memchr() */
 #include <stdarg.h>
 #include <stdio.h>
+#include <stdint.h>
 #include <stdlib.h>
 #include <string.h>
 #include <sys/types.h>
@@ -1138,6 +1139,7 @@
 static int ReadParams(Params *paramsPtr, FCGX_Stream *stream)
 {
     int nameLen, valueLen;
+    size_t totalLen;
     unsigned char lenBuff[3];
     char *nameValue;
 
@@ -1153,6 +1155,10 @@
 	    }
             nameLen = ((nameLen & 0x7f) << 24) + (lenBuff[0] << 16)
                     + (lenBuff[1] << 8) + lenBuff[2];
+	    if (nameLen >= INT_MAX || nameLen >= SIZE_MAX) {
+                SetError(stream, FCGX_PARAMS_ERROR);
+                return -1;
+	    }
         }
         if((valueLen = FCGX_GetChar(stream)) == EOF) {
             SetError(stream, FCGX_PARAMS_ERROR);
@@ -1165,12 +1171,21 @@
 	    }
             valueLen = ((valueLen & 0x7f) << 24) + (lenBuff[0] << 16)
                     + (lenBuff[1] << 8) + lenBuff[2];
+	    if (valueLen >= INT_MAX || valueLen >= SIZE_MAX) {
+                SetError(stream, FCGX_PARAMS_ERROR);
+                return -1;
+	    }
+        }
+        totalLen = (size_t)nameLen + (size_t)valueLen + 2u;
+        if (totalLen < (size_t)nameLen || totalLen < (size_t)valueLen) {
+            SetError(stream, FCGX_PARAMS_ERROR);
+            return -1;
         }
         /*
          * nameLen and valueLen are now valid; read the name and value
          * from stream and construct a standard environment entry.
          */
-        nameValue = (char *)Malloc(nameLen + valueLen + 2);
+        nameValue = (char *)Malloc(totalLen);
         if(FCGX_GetStr(nameValue, nameLen, stream) != nameLen) {
             SetError(stream, FCGX_PARAMS_ERROR);
             free(nameValue);
