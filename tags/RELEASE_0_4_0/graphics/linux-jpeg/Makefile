# $MidnightBSD: mports/graphics/linux-jpeg/Makefile,v 1.3 2009/03/04 00:32:05 laffer1 Exp $

PORTNAME=	jpeg
PORTVERSION=	6b.34
PORTREVISION=	1
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	libjpeg-6b-34

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of the JPEG lib
LICENSE=	other

CONFLICTS=	linux-f10-jpeg-[0-9]*

USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
ONLY_FOR_ARCHS=	i386 amd64

BRANDELF_DIRS=	usr/bin

.include <bsd.port.mk>
