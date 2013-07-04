# $MidnightBSD: mports/audio/linux-libvorbis/Makefile,v 1.2 2008/05/07 21:30:45 crash Exp $
# $FreeBSD: ports/audio/linux-libvorbis/Makefile,v 1.7 2008/04/29 05:11:34 linimon Exp $

PORTNAME=	libvorbis
DISTVERSION=	1.1.0-2
PORTREVISION=	1
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library (Linux version)
LICENSE=        other

CONFLICTS=	linux-f10-libvorbis-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	libogg
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
AUTOMATIC_PLIST=yes
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
