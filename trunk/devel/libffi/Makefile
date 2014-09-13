# $MidnightBSD$

PORTNAME=	libffi
PORTVERSION=	3.0.13
PORTREVISION=	1
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
INSTALL_TARGET=	install-strip
USES=		libtool pathfix pkgconfig

PLIST_SUB=	PORTVERSION=${PORTVERSION}

INFO=		libffi

post-install:
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffi.h ${PREFIX}/include/
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffitarget.h ${PREFIX}/include/

regression-test: build
	@cd ${WRKSRC} && ${MAKE} check

.include <bsd.port.mk>
