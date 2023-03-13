PORTNAME=	sdl_ttf
PORTVERSION=	2.0.11
PORTREVISION=	5
CATEGORIES=	graphics
MASTER_SITES=	https://www.libsdl.org/projects/SDL_ttf/release/
DISTNAME=	SDL_ttf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to use TrueType fonts to render text in SDL applications
WWW=		https://www.libsdl.org/projects/SDL_ttf/

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfreetype.so:print/freetype2

USES=		gmake iconv gl libtool pathfix pkgconfig sdl xorg
USE_SDL=	sdl
USE_XORG=	x11 xorgproto
USE_GL=		gl glu
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -liconv
USE_LDCONFIG=	yes

BINARY_ALIAS=	freetype-config=true

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/glfont ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/showfont \
		${STAGEDIR}${PREFIX}/bin/sdl-showfont

.include <bsd.port.mk>
