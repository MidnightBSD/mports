# Created by: Neil Booth

PORTNAME=	ecdsa
PORTVERSION=	0.16.0
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ECDSA cryptographic signature library (pure python)

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=1.9.0:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

OPTIONS_RADIO=		FASTER
OPTIONS_RADIO_FASTER=	GMPY GMPY2
OPTIONS_DEFAULT=	GMPY2

GMPY_DESC=	GMPY support
GMPY2_DESC=	GMPY2 support

GMPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gmpy>=0:math/py-gmpy@${PY_FLAVOR}
GMPY2_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gmpy2>=0:math/py-gmpy2@${PY_FLAVOR}

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
