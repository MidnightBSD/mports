PORTNAME=	graphql-core
PORTVERSION=	3.3.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	graphql_core-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GraphQL implementation for Python
WWW=		https://github.com/graphql-python/graphql-core-next

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build>=0.13<0.14:devel/py-uv-build@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

MAKE_ENV=	SOURCE_DATE_EPOCH=315532800 # 1980-01-01 00:00:00 UTC

NO_ARCH=	yes

.include <bsd.port.mk>
