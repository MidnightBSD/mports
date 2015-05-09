# $MidnightBSD$

PORTNAME=	gnome-terminal
PORTVERSION=	3.14.2
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal component for the GNOME 3 Desktop

LICENSE=	gpl2

BUILD_DEPENDS=	gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas \
		itstool:${PORTSDIR}/textproc/itstool \
		appdata-tools>=0:${PORTSDIR}/devel/appdata-tools \
		vala:${PORTSDIR}/lang/vala
LIB_DEPENDS=	libstartup-notification-1.so:${PORTSDIR}/x11/startup-notification \
		libuuid.so:${PORTSDIR}/misc/e2fsprogs-libuuid
RUN_DEPENDS=	gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	dconf gnomeprefix gtk30 intlhack nautilus3 vte3
USE_XORG=	sm ice
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-search-provider
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.Terminal.gschema.xml

OPTIONS_SUB=			yes
OPTIONS_DEFINE=			MIGRATION
OPTIONS_DEFAULT=		MIGRATION
MIGRATION_CONFIGURE_ENABLE=	migration
MIGRATION_USE=			GNOME=gconf2
MIGRATION_DESC=			Profile migration to gsettings (pulls in gconf2)

.include <bsd.mport.options.mk>

post-patch:
	@${TOUCH} ${WRKSRC}/aclocal.m4 ${WRKSRC}/Makefile.in \
		${WRKSRC}/configure ${WRKSRC}/config.h.in
	@${REINPLACE_CMD} -e 's|-Wno-suggest-attribute=format||g ; \
		s|-Wno-unused-but-set-variable||g' \
		${WRKSRC}/src/Makefile.in
EXTRA_PATCHES+=	${FILESDIR}/extra-src_terminal-screen.c

.include <bsd.port.mk>
