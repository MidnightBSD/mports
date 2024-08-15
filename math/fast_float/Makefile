PORTNAME=	fast_float
PORTVERSION=	6.1.3
DISTVERSIONPREFIX=	v
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and exact C++ number parsing library
WWW=		https://github.com/fastfloat/fast_float

LICENSE=	apache2 boost mit
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE-APACHE

USES=		cmake compiler:c++11-lang

CMAKE_OFF=	FASTFLOAT_SANITIZE FASTFLOAT_TEST
CMAKE_ON=	FASTFLOAT_INSTALL
NO_ARCH=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	fastfloat

.include <bsd.port.mk>
