# $MidnightBSD$

PORTNAME=	singledispatch
PORTVERSION=	3.4.0.3
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backport of functools.singledispatch from Python 3.4

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six

USES=		python:-3.3
USE_PYTHON=	distutils concurrent autoplist

NO_ARCH=	yes

.include <bsd.port.mk>
