PORTNAME=	pytest4-asyncio
PORTVERSION=	0.10.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:C/4//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Py.test plugin providing fixtures and markers for asyncio (legacy version for pytest 4)

LICENSE=	Apache-2.0

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}pytest-asyncio

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest4>=3.0.6:devel/py-pytest4@${PY_FLAVOR}

NO_ARCH=	yes
USES=		python:3.5+
USE_PYTHON=	autoplist distutils
PYDISTUTILS_PKGNAME=	${PORTNAME:C/4//}

.include <bsd.port.mk>
