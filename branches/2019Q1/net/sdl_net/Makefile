# $MidnightBSD$
# $FreeBSD: ports/net/sdl_net/Makefile,v 1.24 2006/09/20 11:21:56 stas Exp $

PORTNAME=	sdl_net
PORTVERSION=	1.2.8
CATEGORIES=	net
MASTER_SITES=	http://www.libsdl.org/projects/SDL_net/release/
DISTNAME=	SDL_net-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small sample cross-platform networking library

LICENSE=	zlib

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		gmake libtool pathfix pkgconfig
USE_LDCONFIG=	yes
USE_SDL=	sdl

CONFIGURE_ARGS=	--disable-gui

.include <bsd.port.mk>
