# $MidnightBSD$
# $FreeBSD: ports/math/mpc/Makefile,v 1.12 2011/02/21 20:06:58 gerald Exp $

PORTNAME=	mpc
PORTVERSION=	0.9
CATEGORIES=	math devel
MASTER_SITES=	http://www.multiprecision.org/mpc/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of complex numbers with arbitrarily high precision
LICENSE=	lgpl21

LIB_DEPENDS=	gmp.10:${PORTSDIR}/math/gmp \
		mpfr.4:${PORTSDIR}/math/mpfr

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gmp=${LOCALBASE} \
		--with-mpfr=${LOCALBASE}
USE_LDCONFIG=	yes

INFO=		mpc
PLIST_FILES=	include/mpc.h \
		lib/libmpc.a lib/libmpc.la lib/libmpc.so lib/libmpc.so.2

LATEST_LINK=	math_mpc

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.mk>
