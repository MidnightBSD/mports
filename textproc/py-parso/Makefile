PORTNAME=	parso
DISTVERSION=	0.8.7
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Parser
WWW=		https://github.com/davidhalter/parso

LICENSE=	mit python
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.txt
LICENSE_FILE_python=	${WRKSRC}/LICENSE.txt

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docopt>=0:devel/py-docopt@${PY_FLAVOR}

USES=		cpe python:3.6+
CPE_VENDOR=	${PORTNAME}_project
USE_PYTHON=	autoplist distutils pytest

NO_ARCH=	yes
TEST_ARGS=	--doctest-modules

.include <bsd.port.mk>
