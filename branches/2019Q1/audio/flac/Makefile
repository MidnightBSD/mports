# $MidnightBSD$

PORTNAME=	flac
PORTVERSION=	1.3.1
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/flac/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free lossless audio codec

LICENSE=	bsd3 gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_bsd3=${WRKSRC}/COPYING.Xiph

LIB_DEPENDS=	libogg.so:audio/libogg

USES=		compiler:gcc-c++11-lib iconv libtool pathfix pkgconfig tar:xz

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static \
		--enable-sse \
		--with-ogg="${LOCALBASE}" \
		--disable-doxygen-docs \
		--disable-silent-rules \
		--disable-thorough-tests \
		--disable-xmms-plugin
INSTALL_TARGET= install-strip


OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${ARCH} == "i386"
BUILD_DEPENDS+=	nasm:devel/nasm
.endif

post-install:
	cd ${PREFIX}/share/doc && ${MV} ${DISTNAME} flac
	${REINPLACE_CMD} 's:%%PREFIX%%:${PREFIX}:' \
	    ${PREFIX}/man/man1/flac.1
	${RM} ${PREFIX}/man/man1/flac.1.bak

regression-test: build
	@cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE_CMD} check

.include <bsd.port.mk>
