PORTNAME=	sqlite-fts4
PORTVERSION=	1.0.3
CATEGORIES=	databases python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python functions for working with SQLite FTS4 search
WWW=		https://github.com/simonw/sqlite-fts4

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR}

USES=		python
USE_GITHUB=	yes
GH_ACCOUNT=	simonw
USE_PYTHON=	autoplist pep517 pytest

NO_ARCH=	yes

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
