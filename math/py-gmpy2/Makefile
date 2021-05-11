# Created by: Yuri Victorovich <yuri@rawbw.com>

PORTNAME=	gmpy2
PORTVERSION=	2.0.8
CATEGORIES=	math python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GMP/MPIR, MPFR, and MPC interface to Python

LICENSE=	gpl3

LIB_DEPENDS=	libgmp.so:math/gmp \
		libmpc.so:math/mpc \
		libmpfr.so:math/mpfr

USES=		python:3.6+ zip
USE_PYTHON=	distutils autoplist

CONFLICTS=	${PYTHON_PKGNAMEPREFIX}gmpy2-devel-2.1*

post-install:
	@${STRIP_CMD} ${FAKE_DESTEDIR}${PYTHON_SITELIBDIR}/gmpy2*.so

.include <bsd.port.mk>
