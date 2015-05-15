# $MidnightBSD$

PORTNAME=	gdk-pixbuf
PORTVERSION=	2.31.2
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	2
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphic library for GTK+

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

USE_XORG=	xt xi x11
USES=		cpe gmake libtool pathfix pkgconfig tar:xz
CPE_VENDOR=	gnome
USE_GNOME+=	glib20 introspection:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--enable-introspection=yes --with-x11
INSTALL_TARGET=	install-strip

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	JASPER JPEG PNG TIFF
OPTIONS_DEFAULT=JASPER JPEG PNG TIFF
JASPER_CONFIGURE_WITH=	libjasper
JASPER_LIB_DEPENDS=	libjasper.so:${PORTSDIR}/graphics/jasper
JPEG_CONFIGURE_WITPNGH=	libjpeg
JPEG_LIB_DEPENDS=	libjpeg.so:${PORTSDIR}/graphics/jpeg
PNG_CONFIGURE_WITH=	libpng
PNG_LIB_DEPENDS=	libpng.so:${PORTSDIR}/graphics/png
TIFF_CONFIGURE_WITH=	libtiff
TIFF_LIB_DEPENDS=	libtiff.so:${PORTSDIR}/graphics/tiff

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-install:
	@cd ${WRKSRC}/docs/reference/gdk-pixbuf && gmake ${FAKE_MAKEARGS} install-man1

.include <bsd.port.mk>
