PORTNAME=	pytest-runner
PORTVERSION=	2.11.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test support for pytest runner in setup.py

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>=1.15.0:devel/py-setuptools_scm@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

.include <bsd.port.mk>
