PORTNAME=	trio-websocket
PORTVERSION=	0.12.2
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	trio_websocket-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WebSocket library for Trio
WWW=		https://github.com/python-trio/trio-websocket

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}outcome>=1.2.0:devel/py-outcome@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trio>=0.11:net/py-trio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wsproto>=0.14:net/py-wsproto@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=23.2.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-trio>0:devel/py-pytest-trio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trustme>0:security/py-trustme@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517 pytest
TEST_ARGS=	-o trio_mode=true

NO_ARCH=	yes

.include <bsd.port.mk>
