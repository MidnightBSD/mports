
$FreeBSD: ports/lang/gawk/files/patch-io.c,v 1.1 2007/09/03 20:18:36 krion Exp $

--- io.c.orig
+++ io.c
@@ -2480,9 +2480,12 @@
 {
 	struct stat sbuf;
 	struct open_hook *oh;
+	int iop_malloced = FALSE;
 
-	if (iop == NULL)
+	if (iop == NULL) {
 		emalloc(iop, IOBUF *, sizeof(IOBUF), "iop_alloc");
+		iop_malloced = TRUE;
+	}
 	memset(iop, '\0', sizeof(IOBUF));
 	iop->flag = 0;
 	iop->fd = fd;
@@ -2495,7 +2498,8 @@
 	}
 
 	if (iop->fd == INVALID_HANDLE) {
-		free(iop);
+		if (iop_malloced)
+			free(iop);
 		return NULL;
 	}
 	if (isatty(iop->fd))
