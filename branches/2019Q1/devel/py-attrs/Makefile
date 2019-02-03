# $MidnightBSD$

PORTNAME=	attrs
PORTVERSION=	18.1.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python attributes without boilerplate

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist distutils

do-test:
	@(cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest)

.include <bsd.port.mk>
