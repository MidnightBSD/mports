# $MidnightBSD$

PORTNAME=	oauth2
PORTVERSION=	1.5.211
PORTREVISION=	2
CATEGORIES=	net python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library for OAuth version 1.0

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}httplib2>0:${PORTSDIR}/www/py-httplib2
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		python:2
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
