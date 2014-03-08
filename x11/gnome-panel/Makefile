# $MidnightBSD$
# $FreeBSD: ports/x11/gnome-panel/Makefile,v 1.90 2008/04/20 00:42:32 marcus Exp $

PORTNAME=	gnome-panel
PORTVERSION=	2.32.1
PORTREVISION?=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Panel component for the GNOME 2 Desktop
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	gweather.1:${PORTSDIR}/net/libgweather \
		dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
		canberra-gtk.0:${PORTSDIR}/audio/libcanberra

USE_XORG=	ice sm x11 xau xrandr
USE_PYTHON=	2
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USES=		pathfix gettext gmake pkgconfig
USE_GNOME=	gnomeprefix intlhack gnomedesktop libwnck gnomemenus \
		gnomedocutils ltverhack referencehack librsvg2
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--disable-network-manager
LDFLAGS+=	-L${LOCALBASE}/lib
CPPFLAGS+=	-I${LOCALBASE}/include

MAN1=		gnome-panel.1
GCONF_SCHEMAS=	clock.schemas fish.schemas \
		panel-compatibility.schemas panel-general.schemas \
		panel-global.schemas panel-object.schemas \
		panel-toplevel.schemas window-list.schemas \
		workspace-switcher.schemas

OPTIONS_DEFINE=	EVOLUTION BONOBO
OPTIONS_DEFAULT=EVOLUTION BONOBO
EVOLUTION_DESC=	Use the Evolution calendar
BONOBO_DESC=	Support for bonobo applets aka Gnome 2 applets


.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MEVOLUTION}
USE_GNOME+=	evolutiondataserver
#CONFIGURE_ARGS+=--enable-eds
.else
CONFIGURE_ARGS+=--disable-eds
.endif

.if ${PORT_OPTIONS:MBONOBO}
USE_GNOME+=	libbonoboui
CONFIGURE_ARGS+=--enable-bonobo
PLIST_SUB+=	BONOBO=""
.else
CONFIGURE_ARGS+=--disable-bonobo
PLIST_SUB+=	BONOBO="@comment "
.endif

post-patch:
	@${FIND} ${WRKSRC} -type f | \
		${XARGS} -n 10 ${REINPLACE_CMD} -e \
		's|"applications.menu"|"gnome-applications.menu"|'
	@${REINPLACE_CMD} -e 's|xsltproc -o| xsltproc --nonet -o|g' \
		${WRKSRC}/help/clock/Makefile.in \
		${WRKSRC}/help/fish/Makefile.in
	@${REINPLACE_CMD} -e 's|python.* python2\.0|${PYTHON_VERSION}|g' \
		${WRKSRC}/configure

post-install:
	@${MKDIR} ${PREFIX}/lib/gnome-panel/modules

.include <bsd.port.mk>

.endif
