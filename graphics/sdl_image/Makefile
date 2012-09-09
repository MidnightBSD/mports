# $MidnightBSD: mports/graphics/sdl_image/Makefile,v 1.6 2010/05/05 20:40:21 vganji Exp $

PORTNAME=	sdl_image
PORTVERSION=	1.2.5
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://www.libsdl.org/projects/SDL_image/release/
DISTNAME=	SDL_image-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple library to load images of various formats as SDL surfaces
LICENSE=	lgpl

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff

USE_SDL=	sdl
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lm
CONFIGURE_ARGS=	--enable-tif --enable-xcf
#MAKE_ARGS=	LT_CURRENT=10 LT_REVISION=0 LT_AGE=0
USE_LDCONFIG=	yes

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/showimage ${PREFIX}/bin

.include <bsd.port.mk>
