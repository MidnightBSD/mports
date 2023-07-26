PORTNAME=	fixtures
PORTVERSION=	4.0.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fixtures, reusable state for writing clean tests and more
WWW=		https://github.com/testing-cabal/fixtures

LICENSE=	apache2 bsd3
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/Apache-2.0
LICENSE_FILE_bsd3=${WRKSRC}/BSD

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pbr>=5.7.0:devel/py-pbr@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pbr>=5.7.0:devel/py-pbr@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
