# $MidnightBSD$

PORTNAME=	cairo
PORTVERSION=	1.12.16
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
		libpng15.so:${PORTSDIR}/graphics/png \
		libfontconfig.so:${PORTSDIR}/x11-fonts/fontconfig

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${DOCSDIR} \
		--disable-directfb \
		--enable-tee
USES+=		libtool:keepla pathfix pkgconfig
USE_XORG=	pixman xext
USE_GNOME=	referencehack
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--with-html-dir=${DOCSDIR} \
		--disable-directfb \
		--disable-gallium \
		--disable-glesv2 \
		--disable-wgl \
		--disable-egl \
		--enable-tee

OPTIONS_DEFINE=	OPENGL XCB GLIB X11 
OPTIONS_DEFAULT=XCB GLIB X11
XCB_DESC=	Enable XCB (X C-language Binding) Support
GLIB_DESC=	Enable GObject Functions Feature
OPTIONS_SUB=	yes
X11_USE=	xorg=xrender
X11_CONFIGURE_ENABLE=xlib
OPENGL_USE=	gl=gl xorg=glproto:both,dri2proto:both
OPENGL_CONFIGURE_ENABLE=gl
GLIB_USE=	gnome=glib20
GLIB_CONFIGURE_ENABLE=	gobject
XCB_BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:${PORTSDIR}/x11/xcb-util-renderutil
XCB_RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:${PORTSDIR}/x11/xcb-util-renderutil
XCB_CONFIGURE_ENABLE=	xcb
# this has another option --enable-xlib-xcb=auto but it is buggy.

PLIST_SUB+=	LIBVER=11202

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e '/test/s/==/=/g' \
		-e '/LIBS/s/-lrt//'  -e '/LIBS/s|-ldld||' \
		-e '/LIBS/s|-ldl||' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|-lcairo|-lcairo ${PTHREAD_LIBS}|' \
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
