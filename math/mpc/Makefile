# $MidnightBSD$

PORTNAME=	mpc
PORTVERSION=	1.1.0
CATEGORIES=	math devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of complex numbers with arbitrarily high precision

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/COPYING.LESSER

LIB_DEPENDS=	libgmp.so:math/gmp \
		libmpfr.so:math/mpfr

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gmp=${LOCALBASE} \
		--with-mpfr=${LOCALBASE}
CONFIGURE_TARGET=${ARCH}-portbld-freebsd10.4
USE_LDCONFIG=	yes
USES=		libtool

INFO=		mpc
PLIST_FILES=	include/mpc.h \
		lib/libmpc.a lib/libmpc.so lib/libmpc.so.3 lib/libmpc.so.3.1.0

.include <bsd.port.mk>
