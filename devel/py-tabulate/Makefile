# Created by: Nikolay Dachev <freebsd@dacehv.info>

PORTNAME=	tabulate
PORTVERSION=	0.10.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pretty-print tabular data in Python
WWW=		https://github.com/astanin/python-tabulate

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4.3:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=7,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	WIDECHARS
OPTIONS_DEFAULT=WIDECHARS
WIDECHARS_DESC=	Wide characters support

WIDECHARS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wcwidth>=0:devel/py-wcwidth@${PY_FLAVOR}

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPATH} \
		${PYTHON_CMD} -c 'import sys; sys.path.pop(0); import tabulate, pytest; print("Testing", tabulate.__file__, flush=True); sys.exit(pytest.main(["-v", "--doctest-modules", "--ignore", "benchmark"]))'

.include <bsd.port.mk>
