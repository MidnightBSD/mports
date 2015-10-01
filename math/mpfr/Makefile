# $MidnightBSD$

PORTNAME=	mpfr
PORTVERSION=	3.1.2
PORTREVISION=	4
CATEGORIES=	math devel
MASTER_SITES=	http://www.mpfr.org/mpfr-current/
DIST_SUBDIR=	${DISTNAME}

PATCH_SITES=	${MASTER_SITES}
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for multiple-precision floating-point computations

LICENSE=	lgpl3

LIB_DEPENDS=	libgmp.so:${PORTSDIR}/math/gmp

USES=		libtool:keepla tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gmp=${LOCALBASE}

USE_LDCONFIG=	yes

INFO=		mpfr

PORTDOCS=	*

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.mk>
