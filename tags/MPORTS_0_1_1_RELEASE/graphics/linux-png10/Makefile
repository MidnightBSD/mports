# New ports collection makefile for: linux-png
# Date created:		28 September 2000
# Whom:                 sanpei@FreeBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-png10/Makefile,v 1.23 2006/09/01 17:31:18 pav Exp $
#

PORTNAME=	png
PORTVERSION=	1.0.18
CATEGORIES=	graphics linux
DISTNAME=	libpng10-${PORTVERSION}-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of the PNG lib (old 1.0 version)

LATEST_LINK=	linux-png10

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
INSTALLS_SHLIB=	yes

PLIST_FILES=	usr/lib/libpng.so.2.${PORTVERSION} \
		usr/lib/libpng.so.2
DOCSDIR=	${PREFIX}/usr/share/doc/libpng10-${PORTVERSION}
PORTDOCS=	CHANGES LICENSE README TODO example.c libpng.txt

.include <bsd.port.mk>
