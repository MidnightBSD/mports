PORTNAME=	testscenarios
PORTVERSION=	0.5.0
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PyUnit extension for dependency injection
WWW=		https://github.com/testing-cabal/testscenarios

LICENSE=	Apache-2.0 bsd3
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/Apache-2.0
LICENSE_FILE_bsd3=${WRKSRC}/BSD

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pbr>=0:devel/py-pbr@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pbr>=0.11:devel/py-pbr@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}testtools>=0:devel/py-testtools@${PY_FLAVOR}

NO_ARCH=	yes
USE_PYTHON=	autoplist concurrent pep517

USES=		python

.include <bsd.port.mk>
