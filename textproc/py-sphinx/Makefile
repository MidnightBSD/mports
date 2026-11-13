PORTNAME=	sphinx
PORTVERSION=	9.0.4
PORTEPOCH=	1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	python

# NOTE: before committing to this port, contact portmgr to arrange for an
# experimental ports run.  Untested commits may be backed out at portmgr's
# discretion.
MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python documentation generator
WWW=		https://www.sphinx-doc.org/en/master/ \
		https://github.com/sphinx-doc/sphinx

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.12:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss \
		${PYTHON_PKGNAMEPREFIX}alabaster>=0.7.14:textproc/py-alabaster@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Babel>=2.13:devel/py-babel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}docutils>=0.20,1<0.23,1:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}imagesize>=1.3:graphics/py-imagesize@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=3.1:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=23.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>=2.17:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.30.0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}roman-numerals>=1.0.0:textproc/py-roman-numerals@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}snowballstemmer>=2.2:textproc/py-snowballstemmer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-applehelp>=1.0.7:textproc/py-sphinxcontrib-applehelp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-devhelp>=1.0.6:textproc/py-sphinxcontrib-devhelp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-htmlhelp>=2.0.6:textproc/py-sphinxcontrib-htmlhelp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-jsmath>=1.0.1:textproc/py-sphinxcontrib-jsmath@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-qthelp>=1.0.6:textproc/py-sphinxcontrib-qthelp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-serializinghtml>=1.1.9:textproc/py-sphinxcontrib-serializinghtml@${PY_FLAVOR}
TEST_DEPENDS=	graphviz>=0:graphics/graphviz \
		${PYTHON_PKGNAMEPREFIX}cython>=3.0:lang/cython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=9.0,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}defusedxml>=0.7.1:devel/py-defusedxml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.4,1:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools78>=78.1.1:devel/py-setuptools78@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.9:devel/py-typing-extensions@${PY_FLAVOR}

USES=		magick:test python:3.11+
USE_PYTHON=	autoplist concurrent pep517 pytest

# Tests compile extensions with setuptools>=70, outside the global backend.
_SETUPTOOLS_TEST_PRIVATE?=	${PYTHON_LIBDIR}/mports-setuptools/78
TEST_WRKSRC=	${WRKDIR}/test-suite
TEST_ENV+=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${_SETUPTOOLS_TEST_PRIVATE}:${PYTHON_SITELIBDIR} \
		PYTHONDONTWRITEBYTECODE=1
_SPHINX_TEST_VENV=	${WRKDIR}/test-venv

pre-test:
	${PYTHON_CMD} -S -m venv --without-pip ${_SPHINX_TEST_VENV}
	${CP} ${_SETUPTOOLS_TEST_PRIVATE}/distutils-precedence.pth \
		${_SPHINX_TEST_VENV}/lib/python${PYTHON_VER}/site-packages/
	@${MKDIR} ${TEST_WRKSRC}
	@${CP} -R ${WRKSRC}/tests ${TEST_WRKSRC}/
	@${CP} ${WRKSRC}/pyproject.toml ${TEST_WRKSRC}/

do-test:
	cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${TEST_ENV} \
		${_SPHINX_TEST_VENV}/bin/${PYTHON_VERSION} -m pytest -rs -v ${TEST_ARGS}

NO_ARCH=	yes

EXTRACT_CMD=	${SETENV} LC_ALL=en_US.UTF-8 /usr/bin/bsdtar

.include <bsd.port.mk>
