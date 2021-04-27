# Created by: Dmitry Marakasov <amdmi3@FreeBSD.org>

PORTNAME=	pycodestyle
PORTVERSION=	2.7.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python style guide checker

LICENSE=	mit

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils
NO_ARCH=	yes

# tests pass local, fail on magus
NO_TEST=	yes

#do-test:
#	@cd ${WRKSRC} && ${PYTHON_CMD} -m unittest discover testsuite

.include <bsd.port.mk>
