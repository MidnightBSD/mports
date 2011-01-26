
$FreeBSD: ports/devel/oaf/files/patch-liboaf::oaf-fork-server.c,v 1.4 2006/10/14 08:52:47 marcus Exp $

--- liboaf/oaf-fork-server.c	2002/02/14 01:44:13	1.1
+++ liboaf/oaf-fork-server.c	2002/02/14 01:44:39
@@ -264,6 +264,8 @@
 	} else if ((childpid = fork ())) {
 		_exit (0);	/* de-zombifier process, just exit */
 	} else {
+		sigprocmask (SIG_SETMASK, &omask, NULL);
+
                 if (display)
 		  oaf_setenv ("DISPLAY", display);
 		if (od_iorstr)
