# $MidnightBSD$

PORTNAME=	funcsigs
PORTVERSION=	1.0.2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python function signatures from PEP362

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
USE_PYTHON=	autoplist concurrent distutils
USES=		python

do-test:
	cd ${WRKSRC}/ && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
