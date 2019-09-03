PORTNAME=	webp
PORTVERSION=	1.0.2
CATEGORIES=	graphics
MASTER_SITES=	http://downloads.webmproject.org/releases/webp/ \
		https://storage.googleapis.com/downloads.webmproject.org/releases/webp/
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google WebP image format conversion tool

LICENSE=	bsd3

LIB_DEPENDS=	libgif.so:${PORTSDIR}/graphics/giflib \
		libpng.so:${PORTSDIR}/graphics/png \
		libtiff.so:${PORTSDIR}/graphics/tiff

OPTIONS_DEFINE=	X11
OPTIONS_SUB=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	-with-pkgconfigdir=${PREFIX}/libdata/pkgconfig \
		--enable-libwebpdecoder \
		--enable-libwebpdemux  \
		--enable-libwebpmux
USE_LDCONFIG=	yes
USES=		compiler:c11 jpeg libtool

X11_CONFIGURE_OFF=	build_vwebp=no
X11_CONFIGURE_ON=	build_vwebp=yes
X11_USE=		GL=glut

post-patch:
	@${REINPLACE_CMD} '/build_vwebp=yes/d' ${WRKSRC}/configure

.include <bsd.port.mk>
