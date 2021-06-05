--- ext/standard/proc_open.c.orig	2021-06-05 14:06:31.642839000 -0400
+++ ext/standard/proc_open.c	2021-06-05 14:08:19.254768000 -0400
@@ -45,10 +45,10 @@
 #if HAVE_OPENPTY
 # if HAVE_PTY_H
 #  include <pty.h>
-# elif defined(__FreeBSD__)
+# elif defined(__FreeBSD__) && !defined(__MidnightBSD__)
 /* FreeBSD defines `openpty` in <libutil.h> */
 #  include <libutil.h>
-# elif defined(__NetBSD__) || defined(__DragonFly__)
+# elif defined(__NetBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /* On recent NetBSD/DragonFlyBSD releases the emalloc, estrdup ... calls had been introduced in libutil */
 #  if defined(__NetBSD__)
 #    include <sys/termios.h>
