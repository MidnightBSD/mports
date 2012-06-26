# $MidnightBSD: mports/x11-toolkits/pango/Makefile,v 1.19 2011/11/11 00:59:22 laffer1 Exp $

PORTNAME=	pango
PORTVERSION=	1.28.4
PORTREVISION?=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME \
		ftp://ftp.gtk.org/pub/pango/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}/
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source framework for the layout and rendering of i18n text
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/freetype2.pc:${PORTSDIR}/print/freetype2 \
		g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	cairo.2:${PORTSDIR}/graphics/cairo
RUN_DEPENDS=	${FONTSCALE}:${X_FONTS_TTF_PORT} \
		${FONTENCOD}:${X_FONTS_ENCODINGS_PORT} \
		${LOCALBASE}/lib/girepository-1.0/GObject-2.0.typelib:${PORTSDIR}/devel/gobject-introspection

SUB_FILES=	pkg-install
USE_GETTEXT=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack glib20 ltverhack referencehack
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--enable-static
# Hmm.. tough one.  Found this one when I had graphics/hdf installed
# (which installs glist.h) which is picked up before the glib-2.0
# stuff, with Bad Results[tm]
#
GLIB2_CFLAGS=	`pkg-config glib-2.0 --cflags`
PLIST_SUB=	VERSION="1.6.0"

FONTSCALE=	${LOCALBASE}/lib/X11/fonts/TTF/luximb.ttf
FONTENCOD=	${LOCALBASE}/lib/X11/fonts/encodings/encodings.dir

MAN1=		pango-view.1 pango-querymodules.1

.if defined(WITHOUT_X11)
CONFIGURE_ARGS+=	--with-x=no
CPPFLAGS+=		-I${LOCALBASE}/include/freetype2 \
			${GLIB2_CFLAGS} -I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib
PLIST_SUB+=		X11="@comment "
.else
USE_XORG+=		xft xrender
CPPFLAGS+=		-I${LOCALBASE}/include/freetype2 \
			${GLIB2_CFLAGS} -I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib
PLIST_SUB+=		X11=""
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|have_introspection=true|have_introspection=false|g' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>

.endif
