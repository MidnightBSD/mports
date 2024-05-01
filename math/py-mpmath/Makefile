PORTNAME=	mpmath
PORTVERSION=	1.3.0
PORTREVISION=	1
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Library for Arbitrary-precision Floating-point Arithmetic
WWW=		https://www.mpmath.org/

LICENSE=	bsd3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gmpy2>=2.1.0:math/py-gmpy2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>0:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gmpy2>=2.1.0:math/py-gmpy2@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist pytest

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC}/mpmath/tests && ${PYTHON_CMD} runtests.py

.include <bsd.port.mk>
