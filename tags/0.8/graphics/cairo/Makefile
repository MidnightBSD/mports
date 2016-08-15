# $MidnightBSD$

PORTNAME=	cairo
PORTVERSION=	1.14.2
PORTREVISION=	0
PORTEPOCH?=	2
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vector graphics library with cross-device output support

LICENSE=	lgpl

USES=		tar:xz

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2 \
		libpng.so:${PORTSDIR}/graphics/png \
		libfontconfig.so:${PORTSDIR}/x11-fonts/fontconfig

GNU_CONFIGURE=	yes
USES+=		cpe libtool pathfix pkgconfig
CPE_VENDOR=	cairographics
USE_XORG=	pixman xrender xext x11
USE_GNOME=	referencehack glib20
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--with-html-dir=${DOCSDIR} \
		--disable-directfb \
		--disable-gallium \
		--disable-glesv2 \
		--disable-wgl \
		--disable-egl \
		--enable-tee \
		--enable-gobject \
		--enable-xlib

OPTIONS_DEFINE=	OPENGL XCB
OPTIONS_DEFAULT=XCB
XCB_DESC=	Enable XCB (X C-language Binding) Support
OPTIONS_SUB=	yes
OPENGL_USE=	gl=gl xorg=glproto:both,dri2proto:both
OPENGL_CONFIGURE_ENABLE=gl
XCB_BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:${PORTSDIR}/x11/xcb-util-renderutil
XCB_RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:${PORTSDIR}/x11/xcb-util-renderutil
XCB_CONFIGURE_ENABLE=	xcb
# this has another option --enable-xlib-xcb=auto but it is buggy.

PLIST_SUB+=	LIBVER=2.11400.2

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e '/test/s/==/=/g' \
		-e '/LIBS/s/-lrt//'  -e '/LIBS/s|-ldld||' \
		-e '/LIBS/s|-ldl||' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|-lcairo|-lcairo -pthread|' \
		${WRKSRC}/src/*.pc.in
	@${REINPLACE_CMD} -e '/@CAIRO_HAS_PNG_FUNCTIONS_TRUE@.*=/d' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|-ldl||g' \
		${WRKSRC}/util/*/Makefile.in \
		${WRKSRC}/boilerplate/Makefile.in
.if ${PORT_OPTIONS:MOPENGL}
	@${REINPLACE_CMD} 's|@CAIRO_CFLAGS@|-I$$(top_srcdir)/src/glew &|' \
		${WRKSRC}/src/Makefile.in
.endif

.include <bsd.port.mk>

.endif
