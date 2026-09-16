PORTNAME=	aiohappyeyeballs
PORTVERSION=	2.7.1
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Happy Eyeballs for asyncio
WWW=		https://aiohappyeyeballs.readthedocs.io/en/latest/ \
		https://github.com/aio-libs/aiohappyeyeballs

LICENSE=	python
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=2.0.0:devel/py-poetry-core@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_TEST=	yes

NO_ARCH=	yes

.include <bsd.port.mk>
