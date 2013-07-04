# $MidnightBSD: mports/graphics/linux-sdl_image/Makefile,v 1.2 2009/03/21 16:05:16 laffer1 Exp $

PORTNAME=	sdl_image
PORTVERSION=	1.2.5
PORTREVISION=	1
CATEGORIES=	graphics linux
MASTER_SITES=	http://www.libsdl.org/projects/SDL_image/release/
DISTNAME=	SDL_image-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple library to load images as SDL interfaces (linux version)
LICENSE=	lgpl

CONFLICTS=	linux-f10-sdl_image-[0-9]*

USE_LINUX_RPM=	yes
USE_LINUX_APPS=	sdl12
USE_LDCONFIG=	yes
ONLY_FOR_ARCHS=	i386 amd64
DIST_SUBDIR=	rpm
PLIST_SUB+=	SDLIMVER=${PORTVERSION}
HASH_FILE=	${PKGDIR}/distinfo

.include <bsd.port.mk>
