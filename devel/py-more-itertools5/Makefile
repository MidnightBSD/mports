# Created by: William Grzybowski <wg@FreeBSD.org>

PORTNAME=	more-itertools
PORTVERSION=	5.0.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	More routines for operating on iterables, beyond itertools

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=1.0.0:devel/py-six@${PY_FLAVOR}

USES=		python:2.7
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes

PORTSCOUT=	limit:^5\.

.include <bsd.port.mk>
