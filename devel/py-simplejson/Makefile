# $MidnightBSD$

PORTNAME=	simplejson
PORTVERSION=	3.3.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple, fast, extensible JSON encoder/decoder

LICENSE=	mit

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes

regression-test: build
	@(cd ${WRKSRC} && ${PYTHON_CMD} ${PYSETUP} test)

.include <bsd.port.mk>
