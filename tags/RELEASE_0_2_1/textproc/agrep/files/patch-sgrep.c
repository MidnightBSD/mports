
$FreeBSD: ports/textproc/agrep/files/patch-sgrep.c,v 1.1 2002/07/21 01:56:56 naddy Exp $

--- sgrep.c.orig	Sat Apr 11 00:12:02 1992
+++ sgrep.c	Sun Jul 21 03:50:47 2002
@@ -1,5 +1,6 @@
 /* Copyright (c) 1991 Sun Wu and Udi Manber.  All Rights Reserved. */
 #include <stdio.h>
+#include <stdlib.h>
 #include <ctype.h>
 #define MAXSYM  256
 #define MAXMEMBER 8192
