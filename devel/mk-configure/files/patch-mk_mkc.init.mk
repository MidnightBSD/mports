--- mk/mkc.init.mk.orig	2022-11-29 13:09:00.000000000 -0500
+++ mk/mkc.init.mk	2024-07-31 13:24:27.718058000 -0400
@@ -95,6 +95,7 @@
 ROOT_GROUP.FreeBSD   =	wheel
 ROOT_GROUP.Darwin    =	wheel
 ROOT_GROUP.DragonFly =	wheel
+ROOT_GROUP.MidnightBSD = wheel
 ROOT_GROUP.MirBSD    =	wheel
 ROOT_GROUP.HP-UX     =	bin
 ROOT_GROUP.OSF1      =	bin
@@ -275,7 +276,7 @@
 VARDIR     ?=	${PREFIX}/var
 SYSCONFDIR ?=	${PREFIX}/etc
 INFODIR    ?=	${PREFIX}/info
-MANDIR     ?=	${PREFIX}/man
+MANDIR     ?=	${PREFIX}/share/man
 LIBDIR     ?=	${PREFIX}/lib
 SCRIPTSDIR ?=	${BINDIR}
 
