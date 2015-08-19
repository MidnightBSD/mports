# $MidnightBSD$

PORTNAME=	gnome-power-manager
PORTVERSION=	3.14.1
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Power management system for the GNOME Desktop

LICENSE=	gpl2

LIB_DEPENDS=	libupower-glib.so:${PORTSDIR}/sysutils/upower

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix gtk30 intlhack
MAKE_JOBS_UNSAFE=yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-doc-dir=${PREFIX}/share/doc \
		--disable-docbook-docs
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GLIB_SCHEMAS=	org.gnome.power-manager.gschema.xml

OPTIONS_DEFINE=	MANPAGES

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MMANPAGES} || defined(PACKAGE_BUILDING)
BUILD_DEPENDS+=	docbook2html:${PORTSDIR}/textproc/docbook-utils \
		docbook-sgml>0:${PORTSDIR}/textproc/docbook-sgml
PLIST_SUB+=	MAN=""
.else
PLIST_SUB+=	MAN="@comment "
post-patch:
	@${REINPLACE_CMD} -e "s|2MAN_TRUE=$$|2MAN_TRUE='#'|g ; \
		s|2MAN_FALSE='#'|2MAN_FALSE=|g" ${WRKSRC}/configure
.endif

.include <bsd.port.mk>
