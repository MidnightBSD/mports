# $MidnightBSD$

PORTNAME=	mpc
PORTVERSION=	1.0.2
CATEGORIES=	math devel
MASTER_SITES=	http://www.multiprecision.org/mpc/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of complex numbers with arbitrarily high precision
LICENSE=	lgpl2.1

LIB_DEPENDS=	gmp:${PORTSDIR}/math/gmp \
		mpfr:${PORTSDIR}/math/mpfr

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gmp=${LOCALBASE} \
		--with-mpfr=${LOCALBASE}
USE_LDCONFIG=	yes

INFO=		mpc
PLIST_FILES=	include/mpc.h \
		lib/libmpc.a lib/libmpc.la lib/libmpc.so lib/libmpc.so.3

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.mk>
