PORTNAME=	lerc
PORTVERSION=	4.0.0
DISTVERSIONPREFIX=	v
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ library for Limited Error Raster Compression
WWW=		https://esri.github.io/lerc/

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake compiler:c++17-lang dos2unix

CMAKE_ON=	BUILD_SHARED_LIBS
USE_LDCONFIG=	yes

GH_ACCOUNT=	Esri
USE_GITHUB=	yes

.include <bsd.port.mk>
