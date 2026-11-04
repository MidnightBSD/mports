PORTNAME=	libccd
DISTVERSIONPREFIX=	v
DISTVERSION=	2.1
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for collision detection between two convex shapes
WWW=		https://github.com/danfis/libccd

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/BSD-LICENSE

USES=		cmake
USE_GITHUB=	yes
GH_ACCOUNT=	danfis
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOUBLE_PRECISION

DOUBLE_PRECISION_DESC=		Enable double precision computations
DOUBLE_PRECISION_CMAKE_BOOL=	ENABLE_DOUBLE_PRECISION

NO_TEST=	yes

.include <bsd.port.mk>
