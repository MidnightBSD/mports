# $MidnightBSD: mports/devel/libffi/Makefile,v 1.8 2013/03/26 02:51:37 laffer1 Exp $

PORTNAME=	libffi
PORTVERSION=	3.0.13
CATEGORIES=	devel
MASTER_SITES=	SOURCEWARE
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface

LICENSE=	mit

TEST_DEPENDS=	runtest:${PORTSDIR}/misc/dejagnu

OPTIONS_DEFINE=	TESTS
TESTS_DESC=	Include tools for test suite

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MTESTS}
BUILD_DEPENDS:=	${TEST_DEPENDS}
.endif

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=	pathfix pkgconfig
PLIST_SUB=	PORTVERSION=${PORTVERSION}

INFO=		libffi

MAN3=		ffi.3 ffi_call.3 ffi_prep_cif.3 ffi_prep_cif_var.3

post-install:
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffi.h ${PREFIX}/include/
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffitarget.h ${PREFIX}/include/

regression-test: build
	@cd ${WRKSRC} && ${MAKE} check

.include <bsd.port.mk>
