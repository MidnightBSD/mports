# $MidnightBSD$

PORTNAME=	babl
PORTVERSION=	0.1.12
CATEGORIES=	x11
MASTER_SITES=	GIMP

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamic pixel format conversion library

LICENSE=	gpl3

USES=		gmake libtool pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	SIMD

.include <bsd.mport.options.mk>

.if !${PORT_OPTIONS:MSIMD}
CONFIGURE_ARGS+=--disable-mmx \
		--disable-sse \
		--disable-altivec
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|x86_64|amd64|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
