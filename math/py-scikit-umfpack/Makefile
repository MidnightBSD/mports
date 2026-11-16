PORTNAME=	scikit-umfpack
DISTVERSION=	0.4.2
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to UMFPACK sparse direct solver
WWW=		https://scikit-umfpack.github.io/scikit-umfpack/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}meson-python>0,1:devel/meson-python@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>0,1:math/py-numpy@${PY_FLAVOR} \
		swig:devel/swig
LIB_DEPENDS=	libumfpack.so:math/suitesparse-umfpack
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>0,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scipy>0,1:science/py-scipy@${PY_FLAVOR}

USES=		fortran localbase:ldflags pkgconfig python:3.9+
USE_PYTHON=	autoplist pep517 pytest

PEP517_BUILD_CONFIG_SETTING=	-Cbuild-dir=_build
TEST_WRKSRC=	${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/scikits/umfpack/tests
TEST_ARGS=	-c ${WRKSRC}/pytest.ini -p no:cacheprovider
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		PYTHONDONTWRITEBYTECODE=1

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/scikits/umfpack/__umfpack${PYTHON_SOABI}.so

.include <bsd.port.mk>
