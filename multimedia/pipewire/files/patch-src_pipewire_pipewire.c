--- src/pipewire/pipewire.c.orig	2026-03-16 11:54:17 UTC
+++ src/pipewire/pipewire.c
@@ -314,5 +314,5 @@ error:
	pw_log_error("load lib: pw_init() was not called");
	pthread_mutex_unlock(&support_lock);
-	errno = EBADFD;
+	errno = EBADF;
	return NULL;
 }
