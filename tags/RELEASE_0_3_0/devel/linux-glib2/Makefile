# New ports collection makefile for:	linux-glib2
# Date created:				2003-07-05
# Whom:					trevor
#
# $MidnightBSD: mports/devel/linux-glib2/Makefile,v 1.2 2007/09/14 15:31:38 laffer1 Exp $
# $FreeBSD: ports/devel/linux-glib2/Makefile,v 1.16 2006/07/09 21:01:43 bsam Exp $
#

PORTNAME=	glib2
PORTVERSION=	2.6.6
CATEGORIES=	devel linux
DISTNAME=	${PORTNAME}-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Version 2.X Linux/i386 binary port of GLib
LICENSE=	lgpl

USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
INSTALLS_SHLIB=	yes
ONLY_FOR_ARCHS=	i386 amd64

PLIST_SUB+=	LIBVERSION="600.6" PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
