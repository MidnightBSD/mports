PORTNAME=	blinker
PORTVERSION=	1.9.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/pallets-eco/blinker/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, simple object-to-object and broadcast signaling
WWW=		https://pythonhosted.org/blinker/ \
		https://github.com/pallets-eco/blinker

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=0<4:devel/py-flit-core@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
