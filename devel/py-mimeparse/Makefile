PORTNAME=	mimeparse
PORTVERSION=	1.6.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic functions for handling mime-types in Python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	distutils autoplist

do-test:
		@(cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} python${PYTHON_VER} mimeparse_test.py)

.include <bsd.port.mk>
