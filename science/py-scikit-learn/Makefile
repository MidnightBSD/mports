PORTNAME=	scikit-learn
DISTVERSION=	1.4.0
CATEGORIES=	science python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Machine learning algorithms for python
WWW=		https://scikit-learn.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}joblib>0:devel/py-joblib@${PY_FLAVOR} \
		${PYNUMPY} \
		${PYTHON_PKGNAMEPREFIX}scipy>=1.3.2:science/py-scipy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}threadpoolctl>=0:devel/py-threadpoolctl@${PY_FLAVOR}
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		fortran python localbase
USE_PYTHON=	distutils autoplist cython

POST_PLIST=	fix-plist

fix-plist: # https://github.com/scikit-learn/scikit-learn/issues/12681
	@${REINPLACE_CMD} -e "s|lib/python.*/sklearn/datasets/tests/data/openml$$||" ${TMPPLIST}

post-install: # strip binaries
	@${STRIP_CMD} \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/sklearn/*.cpython*.so \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/sklearn/*/*.cpython*.so \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/sklearn/*/*/*.cpython*.so

.include <bsd.port.mk>
