PORTNAME=	wsproto
DISTVERSION=	1.3.2
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sans-IO WebSocket protocol implementation
WWW=		https://pypi.org/project/wsproto/ \
		https://github.com/python-hyper/wsproto/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}h11>=0.16.0<1:net/py-h11@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hypothesis>=6.119.4<7:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.3.3,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist pep517 pytest allflavors

NO_ARCH=	yes

.include <bsd.port.mk>
