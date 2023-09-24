PORTNAME=	async_timeout
PORTVERSION=	4.0.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	async-timeout-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Timeout context manager for asyncio programs
WWW=		https://github.com/aio-libs/async-timeout

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=     ${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
