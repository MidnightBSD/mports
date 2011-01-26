# New ports collection makefile for:	linux-libvorbis
# Date created:				25 Nov 2005
# Whom:					jylefort@FreeBSD.org
#
# $MidnightBSD: mports/audio/linux-libvorbis/Makefile,v 1.1 2008/05/01 07:17:45 laffer1 Exp $
# $FreeBSD: ports/audio/linux-libvorbis/Makefile,v 1.7 2008/04/29 05:11:34 linimon Exp $
#

PORTNAME=	libvorbis
DISTVERSION=	1.1.0-2
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library (Linux version)
LICENSE=        other
RUN_DEPENDS=	${LINUXBASE}/usr/lib/libogg.so.0:${PORTSDIR}/audio/linux-libogg

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
AUTOMATIC_PLIST=yes
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
