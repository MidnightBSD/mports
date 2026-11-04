--- panels/system/users/cc-realm-manager.c.orig	2026-09-11 00:00:00 UTC
+++ panels/system/users/cc-realm-manager.c
@@ -25 +25 @@
-#include <krb5/krb5.h>
+#include <krb5.h>
@@ -649,2 +649,4 @@ login_perform_kinit (krb5_context k5,
+#ifdef HAVE_KRB5_GET_INIT_CREDS_OPT_SET_OUT_CCACHE
         code = krb5_get_init_creds_opt_set_out_ccache (k5, opts, ccache);
         g_return_val_if_fail (code == 0, code);
+#endif
