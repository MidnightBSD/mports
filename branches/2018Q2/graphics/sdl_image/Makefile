# $MidnightBSD$

PORTNAME=	sdl_image
PORTVERSION=	1.2.12
CATEGORIES=	graphics
MASTER_SITES=	http://www.libsdl.org/projects/SDL_image/release/
DISTNAME=	SDL_image-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple library to load images of various formats as SDL surfaces

LICENSE=	lgpl

LIB_DEPENDS=	libjpeg.so:${PORTSDIR}/graphics/jpeg \
		libpng.so:${PORTSDIR}/graphics/png \
		libtiff.so:${PORTSDIR}/graphics/tiff

USES=		gmake libtool pkgconfig pathfix
USE_SDL=	sdl
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd9.1
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lm
CONFIGURE_ARGS=	--enable-tif --enable-xcf
USE_LDCONFIG=	yes

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/showimage ${PREFIX}/bin

.include <bsd.port.mk>
