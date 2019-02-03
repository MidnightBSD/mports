# $MidnightBSD$

PORTNAME=	libGLU
PORTVERSION=	9.0.0
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	ftp://ftp.freedesktop.org/pub/mesa/glu/
DISTNAME=	glu-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL utility library

LICENSE=	mit

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-static
INSTALL_TARGET=	install-strip
USES=		libtool pathfix pkgconfig tar:bzip2
USE_GL=		gl
USE_LDCONFIG=	yes

.include <bsd.port.mk>
