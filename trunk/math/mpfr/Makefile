# $MidnightBSD: mports/math/mpfr/Makefile,v 1.8 2013/02/24 01:51:08 laffer1 Exp $

PORTNAME=	mpfr
PORTVERSION=	3.1.2
CATEGORIES=	math devel
MASTER_SITES=	http://www.mpfr.org/mpfr-current/
DIST_SUBDIR=	${DISTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for multiple-precision floating-point computations
LICENSE=	lgpl

LIB_DEPENDS=	gmp:${PORTSDIR}/math/gmp

USE_AUTOTOOLS=	libtool
USE_GNOME=	ltverhack
USE_XZ=		yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gmp=${LOCALBASE}

USE_LDCONFIG=	yes

INFO=		mpfr

PORTDOCS=	*

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4015
CONFIGURE_ARGS+=	--disable-thread-safe
.endif

.if defined(NOPORTDOCS)
post-patch:
	@${REINPLACE_CMD} 's/install-nobase_dist_docDATA$$//' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} 's/install-data-am: install-dist_docDATA/install-data-am:/' \
		${WRKSRC}/doc/Makefile.in
.endif

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.post.mk>
