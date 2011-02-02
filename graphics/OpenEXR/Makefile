# $MidnightBSD: mports/graphics/OpenEXR/Makefile,v 1.5 2009/09/20 01:22:00 laffer1 Exp $

PORTNAME=	OpenEXR
PORTVERSION=	1.6.1
DISTNAME=	${PORTNAME:L}-${PORTVERSION}
CATEGORIES=	graphics devel
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	${PORTNAME:L}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A high dynamic-range (HDR) image file format
LICENSE=	ilm

LIB_DEPENDS=	Half.6:${PORTSDIR}/graphics/ilmbase

USE_GMAKE=	yes
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	YES

CONFIGURE_ARGS+=--enable-imfexamples
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0

WRKSRC=		${WRKDIR}/${DISTNAME}

test check:	build
	@(cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check)

.include <bsd.port.pre.mk>

# IlmImfTest hangs indefinitely
#
#.if defined(PACKAGE_BUILDING)
#.if ${ARCH} != sparc64 || ${OSVERSION} >= 700055
#.if ${ARCH} != amd64 || ${OSVERSION} < 800000
#pre-install:	test
#.endif
#.endif
#.endif

.include <bsd.port.post.mk>
