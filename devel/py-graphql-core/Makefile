PORTNAME=	graphql-core
PORTVERSION=	3.2.13
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GraphQL implementation for Python
WWW=		https://github.com/graphql-python/graphql-core-next

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

DISTNAME=	graphql_core-${PORTVERSION}

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1<3:devel/py-poetry-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=59<85:devel/py-setuptools@${PY_FLAVOR}

.include <bsd.port.mk>
