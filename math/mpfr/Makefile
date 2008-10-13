# New ports collection makefile for:	mpfr
# Date created:			28 Aug 2005
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD: mports/math/mpfr/Makefile,v 1.2 2008/03/23 19:44:33 laffer1 Exp $
# $FreeBSD: ports/math/mpfr/Makefile,v 1.7 2006/11/30 21:20:07 ale Exp $
#

PORTNAME=	mpfr
PORTVERSION=	2.3.1
CATEGORIES=	math devel
MASTER_SITES=	http://www.mpfr.org/mpfr-current/
DIST_SUBDIR=	mpfr

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for multiple-precision floating-point computations
LICENSE=	gpl2

LIB_DEPENDS=	gmp.7:${PORTSDIR}/math/libgmp4

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gmp=${LOCALBASE} \
		--infodir=${PREFIX}/info \
		--enable-shared
USE_LDCONFIG=	yes

INFO=		mpfr

.include <bsd.port.mk>
