# $MidnightBSD: mports/graphics/linux-f10-sdl_image/Makefile,v 1.1 2011/06/19 13:51:43 laffer1 Exp $
# $FreeBSD: ports/graphics/linux-f10-sdl_image/Makefile,v 1.18 2011/03/03 09:26:40 ehaupt Exp $

PORTNAME=	sdl_image
PORTVERSION=	1.2.6
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple library to load images as SDL interfaces (Linux Fedora 10)
LICENSE=	lgpl

CONFLICTS=	linux-sdl_image-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	jpeg png sdl12 tiff
LINUX_NAME=	SDL_image
LINUX_DIST_VER=	10
RPMVERSION=	6.fc9
BRANDELF_FILES=	usr/bin/showimage
USE_LDCONFIG=	yes

PLIST_FILES=	usr/bin/showimage usr/lib/libSDL_image-1.2.so.0 \
		usr/lib/libSDL_image-1.2.so.0.1.5
DOCSDIR=	${PREFIX}/usr/share/doc/${LINUX_NAME}-${PORTVERSION}
PORTDOCS=	CHANGES COPYING README
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
