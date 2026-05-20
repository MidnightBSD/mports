--- auth-pam.c.orig
+++ auth-pam.c
@@ -100,6 +100,7 @@
 #endif
 #include "monitor_wrap.h"
 #include "srclimit.h"
+#include "blacklist_client.h"
 
 extern ServerOptions options;
 extern struct sshbuf *loginmsg;
@@ -916,6 +917,8 @@
 				sshbuf_free(buffer);
 				return (0);
 			}
+			BLACKLIST_NOTIFY(NULL, BLACKLIST_AUTH_FAIL,
+			    "PAM illegal user");
 			error("PAM: %s for %s%.100s from %.100s", msg,
 			    sshpam_authctxt->valid ? "" : "illegal user ",
 			    sshpam_authctxt->user, sshpam_rhost);
