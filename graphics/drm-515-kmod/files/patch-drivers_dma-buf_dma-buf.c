--- drivers/dma-buf/dma-buf.c.orig	2026-06-11 16:12:56.973401000 -0400
+++ drivers/dma-buf/dma-buf.c	2026-06-11 16:12:56.987856000 -0400
@@ -125,7 +125,7 @@
 
 static int
 dma_buf_stat(struct file *fp, struct stat *sb,
-	     struct ucred *active_cred __unused)
+	     struct ucred *active_cred __unused, struct thread *td __unused)
 {
 
 	/* XXX need to define flags for st_mode */
