PORTNAME=	libffi
DISTVERSION=	3.5.1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface
WWW=		https://sourceware.org/libffi/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	runtest:misc/dejagnu

USES=		compiler:c11 cpe libtool pathfix
CPE_VENDOR=	libffi_project
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

CONFIGURE_ARGS=	--disable-multi-os-directory
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd13.4
INSTALL_TARGET=	install-strip
NO_TEST=	yes

LDFLAGS+=	-Wl,--undefined-version

INFO=		libffi

post-patch:
	@${REINPLACE_CMD} -e 's| -Wno-psabi||g' \
		${WRKSRC}/testsuite/lib/libffi.exp

post-install:
	cd ${PREFIX}/lib && ${LN} -sf libffi.so.8 libffi.so.6

.include <bsd.port.mk>
