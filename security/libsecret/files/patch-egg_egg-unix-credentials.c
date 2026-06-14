--- egg/egg-unix-credentials.c.orig	2026-05-25 20:27:20.488866000 -0400
+++ egg/egg-unix-credentials.c	2026-05-25 20:40:16.816554000 -0400
@@ -142,7 +142,7 @@
 		cred = (struct sockcred *) CMSG_DATA (&cmsg.hdr);
 		*pid = 0;
 		*uid = cred->sc_euid;
-		set_local_creds(sock, 0);
+		{ int _val = 0; setsockopt(sock, 0, LOCAL_CREDS, &_val, sizeof(_val)); }
 #elif defined(HAVE_GETPEEREID) /* OpenBSD */
 		uid_t euid;
 		gid_t egid;
@@ -230,7 +230,7 @@
 #if defined(LOCAL_CREDS) && !defined(HAVE_CMSGCRED)
 	int val = 1;
 	if (setsockopt (sock, 0, LOCAL_CREDS, &val, sizeof (val)) < 0) {
-		fprintf (stderr, "unable to set LOCAL_CREDS socket option on fd %d\n", fd);
+		fprintf (stderr, "unable to set LOCAL_CREDS socket option on fd %d\n", sock);
 		retval = -1;
 	}
 #endif
