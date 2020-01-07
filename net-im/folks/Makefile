# Created by: Koop Mast <kwm@FreeBSD.org>

PORTNAME=	folks
PORTVERSION=	0.11.4
CATEGORIES=	net-im
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to aggregates people from multiple sources

LICENSE=	lgpl2.1

BUILD_DEPENDS=	vapigen:lang/vala \
		${LOCALBASE}/bin/egrep:textproc/gnugrep
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libgcr-3.so:security/gcr \
		libzeitgeist-2.0.so:sysutils/zeitgeist \
		libtelepathy-glib.so:net-im/telepathy-glib

USE_LDCONFIG=	yes
USES=		gettext gmake gnome libtool localbase pathfix pkgconfig \
		readline sqlite tar:xz
USE_GNOME=	evolutiondataserver3 intlhack introspection:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-bluez-backend
CONFIGURE_ENV+=	ac_cv_path_EGREP=${LOCALBASE}/bin/egrep
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.freedesktop.folks.gschema.xml

PLIST_SUB=	LIBVER=25 VERSION=43 LIBVERLONG=25.18.4

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	SOCIALWEB TRACKER
OPTIONS_DEFAULT=SOCIALWEB TRACKER
SOCIALWEB_DESC=	Social web backend
TRACKER_DESC=	Tracker backend
SOCIALWEB_CONFIGURE_ENABLE=	libsocialweb-backend
SOCIALWEB_LIB_DEPENDS=	libsocialweb.so:www/libsocialweb
TRACKER_CONFIGURE_ENABLE=	tracker-backend
TRACKER_LIB_DEPENDS=	libtracker-control-2.0.so:sysutils/tracker

post-patch:
	@${REINPLACE_CMD} -e 's|--fatal-warnings||g' \
		${WRKSRC}/configure
	# Until after when the bundled gir is updated >= 0.11.4
	@${RM} ${WRKSRC}/backends/tracker/lib/FolksTracker-0.6.gir

.include <bsd.port.mk>
