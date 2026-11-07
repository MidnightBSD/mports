PORTNAME=	requests-unixsocket
PORTVERSION=	0.4.1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	requests_unixsocket-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Use requests to talk HTTP via a UNIX domain socket
WWW=		https://github.com/msabramo/requests-unixsocket

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}requests>=1.2.0:www/py-requests@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=0,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}waitress>=0:www/py-waitress@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78 shebangfix
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

SHEBANG_FILES=	requests_unixsocket/tests/test_requests_unixsocket.py

do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest requests_unixsocket/tests

.include <bsd.port.mk>
