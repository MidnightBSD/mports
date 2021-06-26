PORTNAME=	soupsieve
PORTVERSION=	2.0.1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS4 selector implementation for BeautifulSoup

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
# circular dependency for testing
NO_TEST=	yes

.include <bsd.port.mk>
