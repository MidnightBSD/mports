PORTNAME=	configargparse
PORTVERSION=	1.2.3
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	ConfigArgParse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Drop-in replacement for argparse

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}yaml>=0:devel/py-yaml@${PY_FLAVOR}

NO_ARCH=	yes
USE_PYTHON=	autoplist concurrent distutils
USES=		python:3.6+

.include <bsd.port.mk>
