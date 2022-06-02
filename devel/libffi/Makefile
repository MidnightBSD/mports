PORTNAME=	libffi
PORTVERSION=	3.4.2
CATEGORIES=	devel
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	runtest:misc/dejagnu

USES=		compiler:c11 cpe libtool pathfix
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPE_VENDOR=	libffi_project

CONFIGURE_ARGS=	--disable-multi-os-directory
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
INSTALL_TARGET=	install-strip
INFO=		libffi
# magus
NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e 's| -Wno-psabi||g' \
		${WRKSRC}/testsuite/lib/libffi.exp

post-install:
	cd ${PREFIX}/lib && ${LN} -sf libffi.so.8 libffi.so.6

.include <bsd.port.mk>
