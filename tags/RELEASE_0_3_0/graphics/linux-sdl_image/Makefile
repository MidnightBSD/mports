# $MidnightBSD: mports/graphics/linux-sdl_image/Makefile,v 1.1 2006/09/23 22:21:45 laffer1 Exp $

PORTNAME=	sdl_image
PORTVERSION=	1.2.5
CATEGORIES=	graphics linux
MASTER_SITES=	http://www.libsdl.org/projects/SDL_image/release/
DISTNAME=	SDL_image-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple library to load images as SDL interfaces (linux version)
LICENSE=	lgpl

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libSDL-1.2.so.0:${PORTSDIR}/devel/linux-sdl12

USE_LINUX_RPM=	yes
USE_LDCONFIG=	yes
ONLY_FOR_ARCHS=	i386 amd64
DIST_SUBDIR=	rpm
PLIST_SUB+=	SDLIMVER=${PORTVERSION}
MD5_FILE=	${PKGDIR}/distinfo

.include <bsd.port.mk>
