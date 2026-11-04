PORTNAME=	gdal
PORTVERSION=	3.11.5
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python binding for GDAL
WWW=		https://gdal.org/ \
		https://github.com/OSGeo/gdal

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=63:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libgdal.so:graphics/gdal

USES=		compiler:c++17-lang cpe python
USE_PYTHON=	autoplist concurrent pep517

CPE_VENDOR=	osgeo

OPTIONS_DEFINE=	NUMPY
OPTIONS_DEFAULT=NUMPY
NUMPY_DESC=	Enable array support via NumPy

NUMPY_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=2.0.0,1:math/py-numpy@${PY_FLAVOR}
NUMPY_MAKE_ENV=		GDAL_PYTHON_BINDINGS_WITHOUT_NUMPY=no
NUMPY_MAKE_ENV_OFF=	GDAL_PYTHON_BINDINGS_WITHOUT_NUMPY=yes
NUMPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.0.0,1:math/py-numpy@${PY_FLAVOR}

# setuptools 63 keeps the project name's capitalization (GDAL) in the wheel
# and dist-info names; the framework expects the normalized name (gdal)
PEP517_INSTALL_CMD=	${PYTHON_CMD} -m installer --destdir ${FAKE_DESTDIR} --prefix ${TRUE_PREFIX} ${BUILD_WRKSRC}/dist/GDAL-${DISTVERSION}*.whl; \
	${SED} -i '' -e 's|^GDAL-${DISTVERSION}\.dist-info/|gdal-${DISTVERSION}.dist-info/|' ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/GDAL-${DISTVERSION}.dist-info/RECORD; \
	${MV} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/GDAL-${DISTVERSION}.dist-info ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/gdal-${DISTVERSION}.dist-info

# pyproject.toml lists numpy as an unconditional build requirement
post-patch-NUMPY-off:
	${REINPLACE_CMD} -e '/"numpy >=/d' ${WRKSRC}/pyproject.toml

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
