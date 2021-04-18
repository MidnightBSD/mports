# Created by: Cheng-Lung Sung <clsung@FreeBSD.org>

PORTNAME=	redis
PORTVERSION=	3.5.3
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python client for Redis key-value store

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.6+
USE_PYTHON=	distutils autoplist concurrent

OPTIONS_DEFINE=	HIREDIS

HIREDIS_DESC=	High performance response parser (via hiredis)

HIREDIS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hiredis>=0.1.3:databases/py-hiredis@${PY_FLAVOR}

NO_ARCH=	yes
NO_TEST=	yes
CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}redis2

.include <bsd.port.mk>
