PORTNAME=	libwpe
PORTVERSION=	1.12.0
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	https://wpewebkit.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General-purpose library for WPE WebKit
WWW=		https://wpewebkit.org/releases

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon

USES=		compiler:c11 gl meson pkgconfig tar:xz
USE_GL=		egl
USE_LDCONFIG=	yes

.include <bsd.port.mk>
