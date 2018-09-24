#
# $MidnightBSD$
# $FreeBSD: ports/graphics/sdl_ttf/Makefile,v 1.36 2007/05/19 20:10:48 flz Exp $

PORTNAME=	sdl_ttf
PORTVERSION=	2.0.11
CATEGORIES=	graphics
MASTER_SITES=	http://www.libsdl.org/projects/SDL_ttf/release/
DISTNAME=	SDL_ttf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to use TrueType fonts to render text in SDL applications

LICENSE=	lgpl

LIB_DEPENDS=	libfreetype.so:print/freetype2

USE_SDL=	sdl
USE_XORG=	x11
USES=		gmake iconv libtool pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd9.1
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
USE_LDCONFIG=	yes

OPTIONS_DEFINE=               OPENGL
OPTIONS_DEFAULT=      OPENGL

OPENGL_USE=   GL=yes

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/glfont ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/showfont ${PREFIX}/bin

.include <bsd.port.mk>
