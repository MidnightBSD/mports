# $MidnightBSD: mports/graphics/linux-png10/Makefile,v 1.2 2009/03/21 16:02:20 laffer1 Exp $

PORTNAME=	png
PORTVERSION=	1.0.18
PORTREVISION=	1
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	libpng10-${PORTVERSION}-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of the PNG lib (old 1.0 version)
LICENSE=	other

CONFLICTS=	linux-f10-png10-[0-9]*

LATEST_LINK=	linux-png10

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libpng.so.2.${PORTVERSION} \
		usr/lib/libpng.so.2
DOCSDIR=	${PREFIX}/usr/share/doc/libpng10-${PORTVERSION}
PORTDOCS=	CHANGES LICENSE README TODO example.c libpng.txt

.include <bsd.port.mk>
