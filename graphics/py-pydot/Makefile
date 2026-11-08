PORTNAME=	pydot
PORTVERSION=	4.0.1
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to the Graphviz Dot language
WWW=		https://github.com/pydot/pydot

LICENSE=	mit python
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSES/MIT.txt
LICENSE_FILE_python=	${WRKSRC}/LICENSES/Python-2.0.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	dot:graphics/graphviz \
		${PYTHON_PKGNAMEPREFIX}pyparsing>=3.1.0:devel/py-pyparsing@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}chardet>=0:textproc/py-chardet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}parameterized>=0:devel/py-parameterized@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>=0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=7,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=0:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		python:3.8+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 PYTEST_XDIST_AUTO_NUM_WORKERS=2 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPATH} \
		${PYTHON_CMD} -m pytest -p xdist.plugin -p pytest_cov.plugin -n auto --cov

.include <bsd.port.mk>
