--- pp_sys.c.orig	Sat Oct 11 14:57:48 2008
+++ pp_sys.c	Sat Oct 11 14:58:21 2008
@@ -3002,7 +3002,7 @@
 
     case OP_FTEEXEC:
 #ifdef PERL_EFF_ACCESS
-	access_mode = W_OK;
+	access_mode = X_OK;
 #else
 	use_access = 0;
 #endif
