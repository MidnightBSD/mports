# $MidnightBSD$

PORTNAME=	pidgin-twitter
PORTVERSION=	0.8.4
CATEGORIES=	net-im
MASTER_SITES=	http://www.honeyplanet.jp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A pidgin plugin to help twitting via pidgin
LICENSE=	gpl2

BUILD_DEPENDS=	pidgin:${PORTSDIR}/net-im/pidgin
LIB_DEPENDS=	xml2:${PORTSDIR}/textproc/libxml2
RUN_DEPENDS=	pidgin:${PORTSDIR}/net-im/pidgin

USE_GNOME=	pkgconfig glib20
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

PLIST_FILES=	lib/pidgin/pidgin-twitter.so \
		${DATADIR_REL}/prefs.ui
PLIST_DIRS=	${DATADIR_REL}

.include <bsd.port.mk>
