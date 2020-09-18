PORTNAME=	libwpe
PORTVERSION=	1.4.0.1
CATEGORIES=	www
MASTER_SITES=	https://wpewebkit.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General-purpose library for WPE WebKit

LICENSE=	bsd2

LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon

USES=		cmake compiler:c11 gl localbase:ldflags pkgconfig \
		tar:xz

USE_GL=		egl
USE_LDCONFIG=	yes

.include <bsd.port.mk>
