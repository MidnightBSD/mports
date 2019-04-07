PORTNAME=	trollius
PORTVERSION=	2.2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Port of the Tulip project (asyncio module, PEP 3156) on Python 2

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${PY_FUTURES}

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
