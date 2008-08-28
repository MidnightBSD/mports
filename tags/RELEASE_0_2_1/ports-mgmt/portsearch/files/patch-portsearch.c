--- src/portsearch.c.orig	Fri Apr 28 06:47:08 2006
+++ src/portsearch.c	Tue Oct 31 21:55:42 2006
@@ -125,7 +125,7 @@
 	execcmd(cmd, args, _set_portsdir, opts);
 
 	if (opts->portsdir[0] == '\0')
-		opts->portsdir = "/usr/ports";
+		opts->portsdir = "/usr/mports";
 }
 
 static void
