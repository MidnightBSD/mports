PORTNAME=	black
DISTVERSION=	25.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	25

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private Black 25 formatter for test dependencies
WWW=		https://black.readthedocs.io/

LICENSE=	mit python
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE
LICENSE_FILE_python=	${WRKSRC}/src/blib2to3/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>=1.0.3:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}installer>=0.7:devel/py-installer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatch-fancy-pypi-readme>=0:devel/py-hatch-fancy-pypi-readme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=1.20.0:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHONPREFIX_LIBDIR}/mports-setuptools-scm/9/setuptools_scm/__init__.py:devel/py-setuptools-scm9@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}click>=8.0.0:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mypy_extensions>=0.4.3:devel/py-mypy_extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=22.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pathspec>=1.0.1:devel/py-pathspec@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}platformdirs>=2:devel/py-platformdirs@${PY_FLAVOR} \
		${PY_TOMLI}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=6.1.1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	allflavors flavors
NO_ARCH=	yes

_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-black/25
_SCM_DIR=	${PYTHONPREFIX_LIBDIR}/mports-setuptools-scm/9
_TEST_PYTHONPATH=	${FAKE_DESTDIR}${_PRIVATE_DIR}:${WRKSRC}

do-build:
	cd ${BUILD_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} PYTHONPATH=${_SCM_DIR} ${PYTHON_CMD} -m build --no-isolation --wheel

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} \
		${BUILD_WRKSRC}/dist/black-${DISTVERSION}-py3-none-any.whl

do-test:
	cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} \
		PYTHONPATH=${_TEST_PYTHONPATH} \
		${PYTHON_CMD} -m pytest tests

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.0.1:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
