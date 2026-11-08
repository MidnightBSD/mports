PORTNAME=	pytest-httpserver
PORTVERSION=	1.1.5
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pytest_httpserver-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP server for pytest
WWW=		https://github.com/csernazs/pytest-httpserver

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.0.0:devel/py-poetry-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}werkzeug>=2.0.0:www/py-werkzeug@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=6.4.4<8:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=7.1.3,1<10,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=3<8:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
TEST_ENV=	PYTEST_HTTPSERVER_HOST=127.0.0.1 PYTHONDONTWRITEBYTECODE=1 PYTHONSAFEPATH=1
TEST_ARGS=	--import-mode=importlib

.include <bsd.port.mk>
