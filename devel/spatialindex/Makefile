PORTNAME=	spatialindex
DISTVERSION=	1.9.3
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libspatialindex/libspatialindex/releases/download/${DISTVERSION}/
DISTNAME=	${PORTNAME}-src-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General Framework for Developing Spatial Indices
WWW=		https://libspatialindex.org/en/latest/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake:testing compiler:c++11-lang
USE_LDCONFIG=	yes

CMAKE_TESTING_ON=	SIDX_BUILD_TESTS

.include <bsd.port.mk>
