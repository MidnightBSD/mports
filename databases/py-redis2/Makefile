# Created by: Cheng-Lung Sung <clsung@FreeBSD.org>

PORTNAME=	redis
PORTVERSION=	2.10.6
CATEGORIES=	databases python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python client for Redis key-value store

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

OPTIONS_DEFINE=	HIREDIS

HIREDIS_DESC=	High performance response parser (via hiredis)

HIREDIS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hiredis>0:databases/py-hiredis@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	distutils autoplist concurrent

USE_GITHUB=	yes
GH_ACCOUNT=	andymccurdy
GH_PROJECT=	${PORTNAME}-py

NO_ARCH=	yes
NO_TEST=	yes
CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}redis
PORTSCOUT=	limit:^2\.

.include <bsd.port.mk>
