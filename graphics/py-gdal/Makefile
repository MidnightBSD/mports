PORTNAME=	gdal
PORTVERSION=	3.13.3
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python binding for GDAL
WWW=		https://gdal.org/ \
		https://github.com/OSGeo/gdal

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=2.0.0,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
BUILD_RUN_DEPENDS=	gdal>=3.13.3:graphics/gdal
LIB_DEPENDS=	libgdal.so:graphics/gdal

USES=		compiler:c++17-lang cpe python python-setuptools:modern
USE_PYTHON=	autoplist concurrent pep517

CPE_VENDOR=	osgeo

OPTIONS_DEFINE=	NUMPY
OPTIONS_DEFAULT=NUMPY
NUMPY_DESC=	Enable array support via NumPy

NUMPY_MAKE_ENV=		GDAL_PYTHON_BINDINGS_WITHOUT_NUMPY=no
NUMPY_MAKE_ENV_OFF=	GDAL_PYTHON_BINDINGS_WITHOUT_NUMPY=yes
NUMPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>1.0.0,1:math/py-numpy@${PY_FLAVOR}

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
