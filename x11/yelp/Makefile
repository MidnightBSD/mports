# $MidnightBSD$

PORTNAME=	yelp
PORTVERSION=	2.30.2
PORTREVISION=	3
CATEGORIES=	x11 gnome
MASTER_SITES=	FREEBSD_LOCAL/kwm
DISTNAME=	${PORTNAME}-webkit-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help browser for the GNOME 2 desktop

LICENSE=	gpl2

LIB_DEPENDS=	libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib \
		libstartup-notification-1.so:${PORTSDIR}/x11/startup-notification \
		libwebkitgtk-1.0.so:${PORTSDIR}/www/webkit-gtk2 \
		librarian.so:${PORTSDIR}/textproc/rarian

CONFLICTS=	yelp-3.[0-9]*

USES=		desktop-file-utils gettext gmake pathfix pkgconfig tar:bzip2
USE_XORG=	ice
USE_GNOME=	gnomeprefix gnomehack intlhack gconf2 gnomedocutils
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_ENV=	G_CHARSET_ALIAS="${LOCALBASE}/libdata/charset.alias"

GCONF_SCHEMAS=	yelp.schemas

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 4015
LDFLAGS+=	-fstack-protector
.endif

post-extract:
	${RM} -f ${WRKSRC}/data/yelp.schemas

post-patch:
	@${REINPLACE_CMD} -e 's,[-/]unstable,,' \
		-e 's/ --define-variable=includetype=unstable//' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} '/g_thread_init/d' ${WRKSRC}/src/yelp-main.c

.include <bsd.port.post.mk>
