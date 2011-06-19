# $MidnightBSD: mports/graphics/linux-png/Makefile,v 1.3 2009/04/15 00:12:46 laffer1 Exp $ 

PORTNAME=	png
PORTVERSION=	1.2.8
PORTREVISION=	2
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	libpng-${PORTVERSION}-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of the PNG lib
LICENSE=	other

CONFLICTS=	linux-f10-png-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes

PLIST_FILES=	\
		usr/lib/libpng.so.3 \
		usr/lib/libpng.so.3.${PORTVERSION} \
		usr/lib/libpng12.so.0 \
		usr/lib/libpng12.so.0.${PORTVERSION} \
		usr/share/man/man5/png.5.gz
DOCSDIR=	${PREFIX}/usr/share/doc/libpng-${PORTVERSION}
PORTDOCS=	CHANGES LICENSE README TODO example.c libpng.txt

.include <bsd.port.mk>
