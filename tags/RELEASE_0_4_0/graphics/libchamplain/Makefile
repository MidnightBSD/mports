# $MidnightBSD$

PORTNAME=	libchamplain
PORTVERSION=	0.8.1
CATEGORIES=	graphics
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A C library aimed to provide a Gtk+ widget to display rasterized maps and markers
LICENSE=	lgpl

LIB_DEPENDS=	sqlite3.8:${PORTSDIR}/databases/sqlite3 \
		clutter-gtk-0.10.0:${PORTSDIR}/graphics/clutter-gtk \
		soup-gnome-2.4.1:${PORTSDIR}/devel/libsoup-gnome

USE_BZIP2=	yes
USE_GNOME=	pkgconfig gtk20 gnomehack ltverhack:1
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	VERSION=0.8

# python bindings need to get ported
WITHOUT_PYTHON=yes

.if !defined(WITHOUT_PYTHON)
USE_PYTHON=	yes
PYCLUTTER_GTK=		${LOCALBASE}/libdata/pkgconfig/pyclutter-gtk-0.10.pc
BUILD_DEPENDS+=		${PYCLUTTER_GTK}:${PORTSDIR}/graphics/py-clutter-gtk
RUN_DEPENDS+=		${PYCLUTTER_GTK}:${PORTSDIR}/graphics/py-clutter-gtk
CONFIGURE_ARGS+=	--enable-python=yes
PLIST_SUB+=		PYTHON=""
.else
CONFIGURE_ARGS+=	--enable-python=no
PLIST_SUB+=		PYTHON="@comment "
.endif

.pre-everything:
	@${ECHO_CMD} ""
	@${ECHO_CMD} "Specify WITHOUT_PYTHON=yes to disable python bindings"
	@${ECHO_CMD} ""

.include <bsd.port.mk>
