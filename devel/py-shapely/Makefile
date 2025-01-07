PORTNAME=	shapely
PORTVERSION=	1.8.5
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Shapely-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Package for Manipulation 2D Geospatial Geometry
WWW=		https://pypi.org/project/shapely/

LICENSE=	bsd3

LIB_DEPENDS=	libgeos_c.so:graphics/geos

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
