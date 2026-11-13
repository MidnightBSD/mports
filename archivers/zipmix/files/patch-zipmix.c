--- zipmix.c.orig	2016-07-26 12:48:42 UTC
+++ zipmix.c
@@ -2,6 +2,17 @@
 zipmix.exe: zipmix.c; cl zipmix.c /O1 /G6 /MD /link /opt:nowin98
 	del zipmix.obj
 !if 0
+#endif
+
+#if (defined(__unix__) || defined(unix)) && !defined(USG)
+#include <sys/param.h>
+#endif
+
+#if (defined(BSD) && (BSD >= 199306))
+#include <stdlib.h>
+
+#define min(a,b) MIN(a,b)
+#define max(a,b) MAX(a,b)
 #endif
 
 #if defined(_WIN32)
@@ -17,6 +28,8 @@
 #define stricmp strcasecmp
 
 #include <term.h>
+#include <termios.h>
+#include <unistd.h>
 int getch ()
 {
 	struct termios getchnsets, getchosets;
@@ -189,10 +202,11 @@
 }
 
 enum { BOOL_NONE=0,BOOL_OR,BOOL_AND,BOOL_SUB };
-int main (long argc, char **argv)
+int main (int argc, char **argv)
 {
 	unsigned long leng[2];
-	long i, j, k, l, fileng[3], score[4], fmax, ftell43;
+	int i;
+	long j, k, l, fileng[3], score[4], fmax, ftell43;
 	long filespecified = 0, boolop = BOOL_NONE, quiet = 0, overwriteyesmode = 0;
 	short s;
 	char ch, *cptr, *cptr2;
