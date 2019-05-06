PORTNAME=	oauth2
DISTVERSION=	1.9.0.post1
CATEGORIES=	net python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library for OAuth version 1.0

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}httplib2>0:www/py-httplib2@${PY_FLAVOR}

OPTIONS_DEFINE=		TESTS

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist distutils

# not magus compatible.
NO_TEST=	yes

.include <bsd.port.mk>
