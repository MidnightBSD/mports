PORTNAME=	itsdangerous
PORTVERSION=	2.2.0
PORTREVISION=	1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Various helpers to pass data in untrusted environments
WWW=		https://github.com/mitsuhiko/itsdangerous/

LICENSE=	bsd3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3<4:devel/py-flit-core@${PY_FLAVOR}
USES=		python
USE_PYTHON=	pep517 autoplist

NO_ARCH=	yes

.include <bsd.port.mk>
