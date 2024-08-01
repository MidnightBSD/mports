PORTNAME=	concurrencykit
DISTVERSION=	0.7.2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lock-free data structures for high performance concurrent systems
WWW=		https://github.com/concurrencykit/ck

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	aarch64 amd64 armv6 armv7 i386 powerpc powerpc64 powerpc64le

USES=		pkgconfig
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_PROJECT=	ck

HAS_CONFIGURE=	yes

PLIST_SUB=	DISTVERSION=${DISTVERSION}
TEST_TARGET=	check

CONFIGURE_ARGS=	--mandir=${PREFIX}/share/man
CONFIGURE_TARGET=     ${ARCH}-portbld-freebsd12.4

OPTIONS_DEFINE=	RTM VMAPACK
OPTIONS_DEFAULT=VMAPACK

RTM_DESC=	Restricted Transactional Memory (x86_64 only)
VMAPACK_DESC=	Enable pointer packing

RTM_CONFIGURE_ON=	--enable-rtm
VMAPACK_CONFIGURE_ON=	--enable-pointer-packing

post-extract:
	${REINPLACE_CMD} -e 's|PKGCONFIG_DATA=@LIBRARY@|PKGCONFIG_DATA=${PREFIX}/libdata/|g' \
	${WRKSRC}/Makefile.in

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libck.so.${DISTVERSION}

.include <bsd.port.mk>
