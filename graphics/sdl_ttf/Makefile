PORTNAME=	sdl_ttf
PORTVERSION=	2.0.11
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	https://www.libsdl.org/projects/SDL_ttf/release/
DISTNAME=	SDL_ttf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to use TrueType fonts to render text in SDL applications

LICENSE=	zlib

LIB_DEPENDS=	libfreetype.so:print/freetype2

USES=		gmake iconv libtool pathfix pkgconfig
USE_SDL=	sdl
USE_XORG=	x11 xorgproto
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd10.4
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -liconv
USE_LDCONFIG=	yes

OPTIONS_DEFINE=		OPENGL
OPTIONS_DEFAULT=	OPENGL

OPENGL_USE=	GL=yes

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/glfont ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/showfont \
		${STAGEDIR}${PREFIX}/bin/sdl-showfont

.include <bsd.port.mk>
