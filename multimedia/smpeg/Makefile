PORTNAME=	smpeg
PORTVERSION=	0.4.4
PORTREVISION=	10
CATEGORIES=	multimedia
MASTER_SITES=	GENTOO

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free MPEG1 video player library with sound support
WWW=		https://www.lokigames.com/development/smpeg.php3

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler gmake libtool:build sdl
USE_SDL=	sdl
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	GLBASE="${LOCALBASE}" \
		CC="${CXX}" REAL_CC="${CC}" \
		SDL_CONFIG="${SDL_CONFIG}"
#If you want to try the opengl/gtk player (which doesn't seem to work)
#comment out the following line.
CONFIGURE_ARGS=	--disable-opengl-player \
		--disable-gtk-player \
		--enable-mmx
CFLAGS+=	${CFLAGS_${CHOSEN_COMPILER_TYPE}}
CFLAGS_clang=	-Wno-error-narrowing -Wno-c++11-narrowing
LDFLAGS_i386=	-Wl,-znotext
MAKE_ARGS=	LIBTOOL=${LOCALBASE}/bin/libtool
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
