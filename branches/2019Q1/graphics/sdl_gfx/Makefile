# $MidnightBSD$
# $FreeBSD: ports/graphics/sdl_gfx/Makefile,v 1.34 2007/10/28 12:01:32 shaun Exp $

PORTNAME=	sdl_gfx
PORTVERSION=	2.0.25
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://www.ferzkopp.net/Software/SDL_gfx-${PORTVERSION:R}/
DISTNAME=	SDL_gfx-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SDL graphics drawing primitives and other support functions

LICENSE=	zlib

USES=		autoreconf gmake libtool pathfix
PATHFIX_MAKEFILEIN=	Makefile.am
USE_SDL=	sdl
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--includedir=${PREFIX}/include
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	MMX

MMX_CONFIGURE_ENABLE=	mmx
MMX_CFLAGS=		-DUSE_MMX

.include <bsd.mport.options.mk>

.include <bsd.port.mk>
