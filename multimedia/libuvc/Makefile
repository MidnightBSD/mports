PORTNAME=	libuvc
DISTVERSIONPREFIX=	v
DISTVERSION=	0.0.7
PORTREVISION=	1
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform library for USB video devices
WWW=		https://libuvc.github.io/libuvc/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cmake:testing jpeg pkgconfig
USE_GITHUB=	yes
USE_LDCONFIG=	yes

CMAKE_OFF=	BUILD_EXAMPLE

NO_TEST=	yes

.include <bsd.port.mk>
