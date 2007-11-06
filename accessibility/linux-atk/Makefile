# New ports collection makefile for:	linux-atk
# Date created:				2003-07-05
# Whom:					trevor
#
# $MidnightBSD: mports/accessibility/linux-atk/Makefile,v 1.4 2007/09/14 15:07:22 laffer1 Exp $
#

PORTNAME=	atk
PORTVERSION=	1.9.1
PORTREVISION=	1
CATEGORIES=	accessibility linux
DISTNAME=	${PORTNAME}-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessibility Toolkit, Linux/i386 binary
LICENSE=	lgpl

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libglib-2.0.so.0:${PORTSDIR}/devel/linux-glib2

ONLY_FOR_ARCHS=	i386 amd64
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
PLIST_SUB+=	LIBVERSION="901.0" PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
