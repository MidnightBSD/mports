# New ports collection makefile for:	linux-libtheora
# Date created:		17 September 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/multimedia/linux-libtheora/Makefile,v 1.1 2008/08/13 18:52:46 laffer1 Exp $
# $FreeBSD: ports/multimedia/linux-libtheora/Makefile,v 1.1 2006/09/16 20:23:59 sat Exp $
#

PORTNAME=	libtheora
DISTVERSION=	1.0alpha4-2
CATEGORIES=	multimedia linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video codec
LICENSE=	bsd3

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
AUTOMATIC_PLIST=yes
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

post-extract:
	@${RM} -rf ${WRKDIR}/usr/share

.include <bsd.port.mk>
