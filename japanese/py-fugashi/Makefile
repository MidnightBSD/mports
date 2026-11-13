PORTNAME=	fugashi
DISTVERSION=	1.5.2
CATEGORIES=	japanese python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cython MeCab wrapper for fast, pythonic Japanese tokenization
WWW=		https://github.com/polm/fugashi

LICENSE=	mit bsd3
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.mecab

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cython31>=3.1.5<3.2:lang/cython31@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR}

LIB_DEPENDS=	libmecab.so:japanese/mecab
RUN_DEPENDS=	ja-mecab-ipadic>0:japanese/mecab-ipadic
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ipadic>0:japanese/py-ipadic@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}unidic-lite>=1.0.8:japanese/py-unidic-lite@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		PYTHONDONTWRITEBYTECODE=1
TEST_WRKSRC=	${WRKDIR}
TEST_ARGS=	-c ${WRKSRC}/pyproject.toml ${WRKDIR}/tests --import-mode=importlib

PEP517_BUILD_CMD=	${SETENV} PYTHONPATH=${PYTHON_LIBDIR}/mports-cython/31 \
		${PYTHON_SETUPTOOLS_CMD} -m build --no-isolation --wheel ${PEP517_BUILD_CONFIG_SETTING}

pre-test:
	${MKDIR} ${WRKDIR}/tests
	${CP} -R ${WRKSRC}/fugashi/tests/. ${WRKDIR}/tests

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/fugashi/fugashi${PYTHON_TAG}.so

.include <bsd.port.mk>
