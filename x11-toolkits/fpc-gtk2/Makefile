# Created by: Alonso Cardenas Marquez <acm@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/x11-toolkits/fpc-gtk2/Makefile 341492 2014-01-28 00:16:57Z antoine $

PORTREVISION=	0
CATEGORIES=	x11-toolkits lang
PKGNAMESUFFIX=	-gtk2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal interface to the GTK2 libraries

USE_FPC=	cairo x11

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}

OPTIONS_DEFINE=	GTK2
GTK2_DESC=	Gimp Toolkit for X11 GUI (version 2.x)
OPTIONS_DEFAULT=	GTK2

GTK2_USE=	GNOME=gtk20

.include "${MASTERDIR}/Makefile"
