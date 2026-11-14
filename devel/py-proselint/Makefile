PORTNAME=	proselint
DISTVERSION=	0.16.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linter for prose
WWW=		https://github.com/amperser/proselint

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build07>=0.7.22<0.8.0:devel/py-uv-build07@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-re2>=1.1.20251105:devel/py-google-re2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-re2-stubs>=0.1.1:devel/py-google-re2-stubs@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hypothesis>=6.135.11:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.4.1,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=6.2.1:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rstr>=3.2.2:devel/py-rstr@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517 pytest

MAKE_ENV+=	PYTHONPATH=${PYTHONPREFIX_LIBDIR}/mports-uv-build/07

NO_ARCH=	yes

do-test:
	cd ${WRKDIR} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} ${PYTHON_CMD} -c 'import os, sys, proselint, pytest; os.chdir("${TEST_WRKSRC}"); raise SystemExit(pytest.main(["--import-mode=importlib", *sys.argv[1:]]))' ${TEST_ARGS:NDESTDIR=*}

.include <bsd.port.mk>
