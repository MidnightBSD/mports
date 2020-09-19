# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	testscenarios
PORTVERSION=	0.5.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PyUnit extension for dependency injection

LICENSE=	apache2 bsd3
LICENSE_COMB=	dual

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pbr>=0:devel/py-pbr@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pbr>=0.11:devel/py-pbr@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}testtools>=0:devel/py-testtools@${PY_FLAVOR}

NO_ARCH=	yes
USE_PYTHON=	autoplist concurrent distutils
USES=		python

.include <bsd.port.mk>
