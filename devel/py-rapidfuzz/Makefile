PORTNAME=	rapidfuzz
DISTVERSION=	3.14.6
CATEGORIES=	devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rapid fuzzy string matching in Python
WWW=		https://github.com/rapidfuzz/RapidFuzz

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}scikit-build-core>=0.11:devel/py-scikit-build-core@${PY_FLAVOR} \
		cmake:devel/cmake-core \
		ninja:devel/ninja
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.16,1:math/py-numpy@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hypothesis>0:devel/py-hypothesis@${PY_FLAVOR}

USES=		compiler:c++14-lang python:3.11+
USE_PYTHON=	autoplist pep517 pytest

MAKE_ENV+=	RAPIDFUZZ_BUILD_EXTENSION=1

TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

post-install:
	@cd ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME} && \
		${STRIP_CMD} \
			${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}/*.so \
			${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/${PORTNAME}/distance/*.so
	${PYTHON_CMD} -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
	${PYTHON_CMD} -O -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
