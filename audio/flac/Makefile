PORTNAME=	flac
PORTVERSION=	1.4.2
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	https://downloads.xiph.org/releases/flac/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free lossless audio codec
WWW=		https://www.xiph.org/flac/

LICENSE=	bsd3 gpl2 gfdl lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_bsd3=${WRKSRC}/COPYING.Xiph

LIB_DEPENDS=	libogg.so:audio/libogg

USES=		compiler:c11 cpe iconv libtool pathfix pkgconfig tar:xz

CPE_VENDOR=	flac_project

# Preserve UTF-8 filenames in test/flac-to-flac-metadata-test-files/.
# They are referenced by the test suite.
EXTRACT_CMD=	${SETENV} LC_ALL=C.UTF-8 ${TAR}

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static \
		--with-ogg="${LOCALBASE}" \
		--disable-doxygen-docs \
		--disable-thorough-tests \
		--disable-xmms-plugin
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=--disable-vsx

post-install:
	cd ${PREFIX}/lib && ${LN} -sf libFLAC.so.12 libFLAC.so.8

# test_libFLAC:
# "iterator claims file is writable when tester thinks it should not be"
.if ${UID} == 0
do-test:
	@${ECHO_MSG} "The tests cannot be run as root, skipping."
.endif


.include <bsd.port.post.mk>
