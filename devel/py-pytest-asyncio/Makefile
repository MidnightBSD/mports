PORTNAME=	pytest-asyncio
PORTVERSION=	0.10.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Py.test plugin providing fixtures and markers for asyncio

LICENSE=	apache2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=3.0.6:devel/py-pytest@${PY_FLAVOR}

NO_ARCH=	yes
USES=		python:3.5+
USE_PYTHON=	autoplist distutils

.include <bsd.port.mk>
