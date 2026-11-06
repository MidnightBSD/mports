PORTNAME=	shapely
PORTVERSION=	2.1.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/shapely/shapely/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Package for Manipulation 2D Geospatial Geometry
WWW=		https://pypi.org/project/shapely/

LICENSE=	bsd3

LIB_DEPENDS=	libgeos_c.so:graphics/geos

USES=		python
USE_PYTHON=	autoplist concurrent cython pep517 pytest

NO_TEST=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.25,1<3,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=61.0.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.21,1:math/py-numpy@${PY_FLAVOR}

LICENSE_FILE=	${WRKSRC}/LICENSE.txt

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR}

.include <bsd.port.mk>
