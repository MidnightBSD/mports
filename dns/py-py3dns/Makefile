# Created by: Mark Linimon <linimon@lonesome.com>

PORTNAME=	py3dns
PORTVERSION=	3.2.1
CATEGORIES=	dns python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 3 DNS library

LICENSE=	CNRI
LICENSE_NAME=	CNRI LICENSE AGREEMENT
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		python:3.3+
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.mk>
