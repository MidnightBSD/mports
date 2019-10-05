# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	asyncio
PORTVERSION=	3.4.3
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reference implementation of PEP 3156 (Asynchronous IO)

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		python:3.3+
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes
NO_TEST=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
