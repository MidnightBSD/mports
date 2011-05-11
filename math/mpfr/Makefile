# $MidnightBSD: mports/math/mpfr/Makefile,v 1.5 2010/07/31 03:09:07 laffer1 Exp $

PORTNAME=	mpfr
PORTVERSION=	3.0.0
CATEGORIES=	math devel
MASTER_SITES=	http://www.mpfr.org/mpfr-current/
DIST_SUBDIR=	mpfr

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for multiple-precision floating-point computations
LICENSE=	lgpl

LIB_DEPENDS=	gmp.10:${PORTSDIR}/math/gmp

USE_XZ=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gmp=${LOCALBASE} \
		--infodir=${PREFIX}/info \
		--enable-shared
USE_LDCONFIG=	yes

INFO=		mpfr

PORTDOCS=	*

.if defined(NOPORTDOCS)
post-patch:
	@${REINPLACE_CMD} 's/install-nobase_dist_docDATA$$//' \
		${WRKSRC}/Makefile.in
.endif

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.mk>
