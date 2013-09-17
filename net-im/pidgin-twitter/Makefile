# $MidnightBSD$

PORTNAME=	pidgin-twitter
PORTVERSION=	0.9.2
PORTREVISION=	1
CATEGORIES=	net-im
MASTER_SITES=	http://www.honeyplanet.jp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A pidgin plugin to help twitting via pidgin

LICENSE=	gpl2

BUILD_DEPENDS=	pidgin:${PORTSDIR}/net-im/pidgin
LIB_DEPENDS=	xml2:${PORTSDIR}/textproc/libxml2
RUN_DEPENDS=	pidgin:${PORTSDIR}/net-im/pidgin

FAKE_MAKEARGS+=	PIDGIN_PLUGIN_DIR="${FAKE_DESTDIR}${PREFIX}/lib/pidgin" \
		PIDGIN_DATA_DIR="${FAKE_DESTDIR}${PREFIX}/share"

USES=		pkgconfig
USE_GNOME=	glib20
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

PLIST_FILES=	lib/pidgin/pidgin-twitter.so \
		share/pidgin-twitter/prefs.ui
PLIST_DIRS=	share/pidgin-twitter \
		lib/pidgin

pre-install:
	@${MKDIR} ${PREFIX}/lib/pidgin

post-patch:
	@${REINPLACE_CMD} -e 's|-Werror||g' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
