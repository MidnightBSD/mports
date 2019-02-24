# Created by: Wen Heping <wenheping@gmail.com>

PORTNAME=	mpmath
PORTVERSION=	1.0.0
CATEGORIES=	math python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Library for Arbitrary-precision Floating-point Arithmetic

LICENSE=	bsd3

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/gmpy.so:math/py-gmpy@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
