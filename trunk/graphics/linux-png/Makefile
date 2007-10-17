# New ports collection makefile for: linux-png
# Date created:		28 September 2000
# Whom:                 sanpei@FreeBSD.org
#
# $MidnightBSD: mports/graphics/linux-png/Makefile,v 1.1 2006/09/23 22:21:45 laffer1 Exp $ 
# $FreeBSD: ports/graphics/linux-png/Makefile,v 1.23 2006/07/09 21:01:44 bsam Exp $
#

PORTNAME=	png
PORTVERSION=	1.2.8
PORTREVISION=	2
CATEGORIES=	graphics linux
DISTNAME=	libpng-${PORTVERSION}-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of the PNG lib

ONLY_FOR_ARCHS=	i386 amd64
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
INSTALLS_SHLIB=	yes

PLIST_FILES=	\
		usr/lib/libpng.so.3 \
		usr/lib/libpng.so.3.${PORTVERSION} \
		usr/lib/libpng12.so.0 \
		usr/lib/libpng12.so.0.${PORTVERSION} \
		usr/share/man/man5/png.5.gz
DOCSDIR=	${PREFIX}/usr/share/doc/libpng-${PORTVERSION}
PORTDOCS=	CHANGES LICENSE README TODO example.c libpng.txt

.include <bsd.port.mk>
