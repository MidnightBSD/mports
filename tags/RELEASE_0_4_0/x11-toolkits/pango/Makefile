# $MidnightBSD: mports/x11-toolkits/pango/Makefile,v 1.21 2013/01/17 05:14:48 laffer1 Exp $

PORTNAME=	pango
PORTVERSION=	1.30.1
PORTREVISION?=	0
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source framework for the layout and rendering of i18n text
LICENSE=	lgpl

USE_XZ=		yes

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
USE_PKGCONFIG=	build
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	VERSION="1.6.0"

FONTSCALE=	${LOCALBASE}/lib/X11/fonts/TTF/luximb.ttf
FONTENCOD=	${LOCALBASE}/lib/X11/fonts/encodings/encodings.dir

MAN1=		pango-view.1 pango-querymodules.1

.include <bsd.mport.options.mk>

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

pre-configure:
.if !exists(${LOCALBASE}/libdata/pkgconfig/cairo-gobject.pc)
	@${ECHO_CMD} "${PKGNAME}: Needs cairo with GLIB (GObject) support enabled."
	@${FALSE}
.endif

.include <bsd.port.mk>

.endif
