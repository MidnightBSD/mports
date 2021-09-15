# $MidnightBSD$

PORTNAME=	libtheora
PORTVERSION=	1.1.1
PORTREVISION=	7
CATEGORIES=	multimedia
MASTER_SITES=	https://downloads.xiph.org/releases/theora/ \
		https://ftp.osuosl.org/pub/xiph/releases/theora/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Theora video codec for the Ogg multimedia streaming system

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libogg.so:audio/libogg \
		libvorbis.so:audio/libvorbis

USES=		libtool localbase pathfix tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-sdltest \
		--disable-examples
INSTALL_TARGET=	install-strip
NO_TEST=yes
USE_LDCONFIG=	yes

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|doc||g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's,  x86_64),  x86_64|amd64),; \
		/ac_lib/ s,compat,,' ${WRKSRC}/configure
.if ${ARCH}=="amd64"
	@${REINPLACE_CMD} -e 's|#define OC_X86_ASM|#undef OC_X86_ASM|' ${WRKSRC}/configure
.endif

.include <bsd.port.mk>
