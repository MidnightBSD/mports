PORTNAME=	wifimgr
DISTVERSION=	1.25
CATEGORIES=	net-mgmt sysutils
MASTER_SITES=	https://opal.com/src/wifimgr/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WiFi Networks Manager
WWW=		https://opal.com/src/wifimgr/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz

USES=		desktop-file-utils gnome pkgconfig tar:xz xorg
USE_XORG=	x11
USE_GNOME=	cairo gdkpixbuf
INSTALLS_ICONS=	yes

OPTIONS_DEFINE=	GTK2 NLS
OPTIONS_SUB=	yes

GTK2_USE=	GNOME=gtk20
GTK2_MAKE_ENV=	GTK_VERSION=2
GTK2_USE_OFF=	GNOME=gtk30

NLS_USES=	gettext-runtime gettext-tools
NLS_CFLAGS_OFF=	-DWITHOUT_NLS
NLS_MAKE_ENV_OFF=	WITHOUT_NLS=yes

.include <bsd.port.mk>
