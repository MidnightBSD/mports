# $MidnightBSD$

PORTNAME=	libffi
PORTVERSION=	3.2.1
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SOURCEWARE/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	runtest:${PORTSDIR}/misc/dejagnu

USES=		libtool pathfix
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

OPTIONS_DEFINE=	TESTS

TESTS_DESC=		Include tools for test suite
TESTS_BUILD_DEPENDS=	${TEST_DEPENDS}

INSTALL_TARGET=	install-strip
INFO=		libffi
PLIST_SUB=	PORTVERSION=${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's| -Wno-psabi||g' \
		${WRKSRC}/testsuite/lib/libffi.exp

post-install:
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffi.h ${PREFIX}/include/
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffitarget.h ${PREFIX}/include/

regression-test: build
	@(cd ${WRKSRC} && ${MAKE_CMD} check)

.include <bsd.port.mk>
