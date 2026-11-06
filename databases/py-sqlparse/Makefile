PORTNAME=	sqlparse
PORTVERSION=	0.6.0
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Non-validating SQL parser for Python
WWW=		https://github.com/andialbrecht/sqlparse

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}

USES=		cpe python shebangfix
CPE_VENDOR=	sqlparse_project
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

SHEBANG_FILES=	sqlparse/cli.py

.include <bsd.port.mk>
