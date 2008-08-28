# New ports collection makefile for:	linux-sdl_image
# Date created:				09 July 2004
# Whom:                         	Nicola Vitale <nivit@email.it>
# Based on:				devel/linux-sdl12 by martin@tradex.sk
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-sdl_image/Makefile,v 1.9 2006/08/03 23:24:08 bsam Exp $
#

PORTNAME=	sdl_image
PORTVERSION=	1.2.5
CATEGORIES=	graphics linux
MASTER_SITES=	http://www.libsdl.org/projects/SDL_image/release/
DISTNAME=	SDL_image-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple library to load images as SDL interfaces (linux version)

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libSDL-1.2.so.0:${PORTSDIR}/devel/linux-sdl12

USE_LINUX_RPM=	yes
INSTALL_SHLIB=	yes
ONLY_FOR_ARCHS=	i386 amd64
DIST_SUBDIR=	rpm
PLIST_SUB+=	SDLIMVER=${PORTVERSION}
MD5_FILE=	${PKGDIR}/distinfo

.include <bsd.port.mk>
