PORTNAME=	redis
PORTVERSION=	5.0.1
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python client for Redis key-value store
WWW=		https://github.com/redis/redis-py

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent distutils pytest

NO_ARCH=	yes
NO_TEST=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}redis[0-9]

OPTIONS_DEFINE=	HIREDIS
HIREDIS_DESC=	High performance response parser

HIREDIS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hiredis>=1.0.0:databases/py-hiredis@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} <= 31102
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}async_timeout>=4.0.2:devel/py-async_timeout@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
