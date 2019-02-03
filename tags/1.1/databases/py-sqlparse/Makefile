# $MidnightBSD$

PORTNAME=	sqlparse
PORTVERSION=	0.2.4
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Non-validating SQL parser for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}sqlparse01 ${PYTHON_PKGNAMEPREFIX}sqlparse020

NO_ARCH=	yes
USE_PYTHON=	autoplist concurrent distutils
USES=		python

.include <bsd.port.mk>
