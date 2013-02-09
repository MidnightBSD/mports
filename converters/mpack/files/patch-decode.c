--- decode.c.orig	2003-07-21 22:47:54.000000000 +0200
+++ decode.c	2012-01-12 19:22:04.000000000 +0100
@@ -26,8 +26,10 @@
  * SOFTWARE.  */
 
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <ctype.h>
+#include <unistd.h>
 #include "xmalloc.h"
 #include "common.h"
 #include "part.h"
@@ -35,8 +37,22 @@
 
 extern char *os_idtodir(char *id);
 extern FILE *os_newtypedfile(char *fname, char *contentType, int flags, params contentParams);
+extern FILE *os_createfile(char *fname);
 extern FILE *os_createnewfile(char *fname);
 extern char *md5contextTo64(MD5_CTX *context);
+extern void warn(char *s);
+extern void os_perror(char *str);
+extern void chat(char *s);
+extern void os_donewithdir(char *dir);
+extern void os_warnMD5mismatch(void);
+extern void os_closetypedfile(FILE *outfile);
+
+extern int part_depth(struct part *part);
+extern void part_ungets(char *s, struct part *part);
+extern void part_close(struct part *part);
+extern int part_fill(struct part *part);
+extern void part_addboundary(struct part *part, char *boundary);
+extern int part_readboundary(struct part *part);
 
 /* The possible content transfer encodings */
 enum encoding { enc_none, enc_qp, enc_base64 };
@@ -49,6 +65,17 @@
 void from64(struct part *inpart, FILE *outfile, char **digestp, int suppressCR);
 void fromqp(struct part *inpart, FILE *outfile, char **digestp);
 void fromnone(struct part *inpart, FILE *outfile, char **digestp);
+int handlePartial(struct part *inpart, char *headers, params contentParams,
+		  int extractText);
+int ignoreMessage(struct part *inpart);
+int handleMultipart(struct part *inpart, char *contentType,
+		    params contentParams, int extractText);
+int handleUuencode(struct part *inpart, char *subject, int extractText);
+int handleText(struct part *inpart, enum encoding contentEncoding);
+int saveToFile(struct part *inpart, int inAppleDouble, char *contentType,
+	       params contentParams, enum encoding contentEncoding,
+	       char *contentDisposition, char *contentMD5);
+
 /*
  * Read and handle an RFC 822 message from the body-part 'inpart'.
  */
@@ -624,7 +651,7 @@
     }
     thispart = atoi(p);
 
-    if (p = getParam(contentParams, "total")) {
+    if ((p = getParam(contentParams, "total"))) {
 	nparts = atoi(p);
 	if (nparts <= 0) {
 	    warn("partial message has invalid number of parts");
@@ -632,7 +659,7 @@
 	}
 	/* Store number of parts in reassembly directory */
 	sprintf(buf, "%sCT", dir);
-	partfile = os_createnewfile(buf);
+	partfile = os_createfile(buf);
 	if (!partfile) {
 	    os_perror(buf);
 	    goto ignore;
@@ -643,7 +670,7 @@
     else {
 	/* Try to retrieve number of parts from reassembly directory */
 	sprintf(buf, "%sCT", dir);
-	if (partfile = fopen(buf, "r")) {
+	if ((partfile = fopen(buf, "r"))) {
 	    if (fgets(buf, sizeof(buf), partfile)) {
 		nparts = atoi(buf);
 		if (nparts < 0) nparts = 0;
