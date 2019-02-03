# $MidnightBSD$

PORTNAME=	libtheora
PORTVERSION=	1.1.1
PORTREVISION=	5
CATEGORIES=	multimedia
MASTER_SITES=	http://downloads.xiph.org/releases/theora/ \
		http://distfiles.master.finkmirrors.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Theora video codec for the Ogg multimedia streaming system

LICENSE=	bsd3

LIB_DEPENDS=	libogg.so:audio/libogg \
		libvorbis.so:${PORTSDIR}/audio/libvorbis

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-sdltest \
		--disable-examples
CPPFLAGS+=	-I${LOCALBASE}/include 
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
USES=		libtool tar:bzip2
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
