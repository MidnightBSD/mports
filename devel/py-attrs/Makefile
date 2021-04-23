PORTNAME=	attrs
PORTVERSION=	20.3.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python attributes without boilerplate

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils

# circurlar loop.  Tests depend on pytest, which depends on this.
NO_TEST=	yes

.include <bsd.port.mk>
