PORTNAME=	aiosqlite
PORTVERSION=	0.15.0
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AsyncIO bridge to the standard sqlite3 module for Python 3.5+

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR}

USES=		python:3.5+
USE_PYTHON=	autoplist distutils

.include <bsd.port.mk>
