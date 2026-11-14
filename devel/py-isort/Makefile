PORTNAME=	isort
PORTVERSION=	9.0.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/PyCQA/isort/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python utility/library to sort Python imports
WWW=		https://github.com/PyCQA/isort

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-mypyc>=0:devel/py-hatch-mypyc@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mypy_extensions>=1.1.0:devel/py-mypy_extensions@${PY_FLAVOR}
TEST_DEPENDS=	git:devel/git \
		${PYTHON_PKGNAMEPREFIX}example-isort-sorting-plugin>=0.1.0:devel/py-example-isort-sorting-plugin@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}example-shared-isort-profile>=0.1.0:devel/py-example-shared-isort-profile@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=6.140.3:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesmith>=0.3.3:devel/py-hypothesmith@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}libcst>=1.9.0:devel/py-libcst@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.4.2,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-benchmark>=5.1.0:devel/py-pytest-benchmark@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	COLORS PLUGINS
COLORS_DESC=	Color output support
PLUGINS_DESC=	Setuptools integration support

COLORS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}colorama>=0.4.6:devel/py-colorama@${PY_FLAVOR}
PLUGINS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR}

PYTHON_TEST_ENV?=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${TEST_WRKSRC}

do-test:
	@cd ${WRKDIR} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} ${PYTHON_CMD} -c 'import isort, os, pytest; os.chdir("${TEST_WRKSRC}"); raise SystemExit(pytest.main([]))'

.include <bsd.port.mk>
