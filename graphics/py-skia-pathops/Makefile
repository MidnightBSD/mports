PORTNAME=	skia-pathops
DISTVERSION=	0.9.2
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	skia_pathops-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python access to Skia path operations
WWW=		https://github.com/fonttools/skia-pathops

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	gn:devel/gn \
		ninja:devel/ninja \
		${PYTHON_PKGNAMEPREFIX}cython>=3.2.0:lang/cython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		compiler:c++20-lang python:3.10+
USE_PYTHON=	autoplist concurrent pep517 pytest

BINARY_ALIAS=	python3=${PYTHON_CMD}
MAKE_ENV=	BUILD_SKIA_FROM_SOURCE=0 \
		SKIA_LIBRARY_DIR=${WRKDIR}/skia-build

pre-build:
	${SETENV} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/configure-skia.py \
		${WRKSRC}/src/cpp/skia-builder/build_skia.py \
		${LOCALBASE}/bin/gn ${WRKDIR}/skia-build "${CC}" "${CXX}"
	${SETENV} ${WRK_ENV} ${MAKE_ENV} ${LOCALBASE}/bin/ninja -C ${WRKDIR}/skia-build -j ${MAKE_JOBS_NUMBER} skia

post-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/src/cpp/skia-builder/skia/LICENSE \
		${DATADIR}/Skia-LICENSE
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
