
$FreeBSD: ports/comms/tits/files/patch-listener.c,v 1.1 2006/01/06 15:25:13 mich Exp $

--- listener.c.orig
+++ listener.c
@@ -189,10 +189,6 @@
 	    NULL)
 		context_del_client(cc->cc_ctx, ccc);
 
-	if (lc->lc_args.la_address)
-		(void) free(lc->lc_args.la_address);
-	(void) free(lc->lc_args.la_port);
-
 	(void) free(lc);
 }
 
