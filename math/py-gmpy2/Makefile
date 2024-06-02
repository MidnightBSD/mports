PORTNAME=	gmpy2
DISTVERSION=	2.1.5
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GMP/MPIR, MPFR, and MPC interface to Python
WWW=		https://gmpy2.readthedocs.io/en/latest/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgmp.so:math/gmp \
		libmpc.so:math/mpc \
		libmpfr.so:math/mpfr

USES=		localbase python
USE_PYTHON=	distutils autoplist

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/gmpy2*.so

.include <bsd.port.mk>
