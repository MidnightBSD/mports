

PORTNAME=	libGLU
PORTVERSION=	9.0.1
CATEGORIES=	graphics
MASTER_SITES=	ftp://ftp.freedesktop.org/pub/mesa/glu/ \
		https://mesa.freedesktop.org/archive/glu/
DISTNAME=	glu-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL utility library

LICENSE=	mit

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-static
INSTALL_TARGET=	install-strip
USES=		gl libtool pathfix pkgconfig tar:xz xorg
USE_GL=		gl
USE_LDCONFIG=	yes

.include <bsd.port.mk>
