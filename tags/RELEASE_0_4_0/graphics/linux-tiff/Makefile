# $MidnightBSD: mports/graphics/linux-tiff/Makefile,v 1.3 2009/04/15 00:13:50 laffer1 Exp $

PORTNAME=	tiff
PORTVERSION=	3.7.1
PORTREVISION=	2
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	libtiff-${PORTVERSION}-6.fc4.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TIFF library, Linux/i386 binary
LICENSE=	mit

CONFLICTS=	linux-f10-tiff-[0-9]*

ONLY_FOR_ARCHS=	amd64 i386
USE_GCPIO=	yes
USE_LINUX_APPS=	jpeg
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB+=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
