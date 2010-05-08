# $MidnightBSD: mports/math/mpfr/Makefile,v 1.3 2008/10/13 20:52:05 laffer1 Exp $

PORTNAME=	mpfr
PORTVERSION=	2.3.1
PORTREVISION=	1
CATEGORIES=	math devel
MASTER_SITES=	http://www.mpfr.org/mpfr-current/
DIST_SUBDIR=	mpfr

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for multiple-precision floating-point computations
LICENSE=	gpl2

LIB_DEPENDS=	gmp.10:${PORTSDIR}/math/gmp

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gmp=${LOCALBASE} \
		--infodir=${PREFIX}/info \
		--enable-shared
USE_LDCONFIG=	yes

INFO=		mpfr

.include <bsd.port.mk>
