# $MidnightBSD$

PORTNAME=	OpenEXR
PORTVERSION=	1.6.1
DISTNAME=	${PORTNAME:L}-${PORTVERSION}
CATEGORIES=	graphics devel
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	${PORTNAME:L}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A high dynamic-range (HDR) image file format
LICENSE=	bsd3

LIB_DEPENDS=	Half.6:${PORTSDIR}/graphics/ilmbase

USE_GMAKE=	yes
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	YES

CONFIGURE_ARGS+=--enable-imfexamples

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
