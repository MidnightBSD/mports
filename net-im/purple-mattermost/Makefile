PORTNAME=	purple-mattermost
PORTVERSION=	2.1
DISTVERSIONPREFIX=	v
PORTREVISION=	1
CATEGORIES=	net-im

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mattermost plugin for libpurple
WWW=		https://github.com/EionRobb/purple-mattermost

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	discount>=0:textproc/discount
LIB_DEPENDS=	libjson-glib-1.0.so:devel/json-glib \
		libpurple.so:net-im/libpurple

USES=		gettext gmake gnome localbase pkgconfig
USE_GNOME=	glib20
USE_LDCONFIG=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	EionRobb

PLIST_FILES=	lib/purple-2/libmattermost.so \
		share/pixmaps/pidgin/protocols/16/mattermost.png \
		share/pixmaps/pidgin/protocols/22/mattermost.png \
		share/pixmaps/pidgin/protocols/48/mattermost.png

.include <bsd.port.mk>
