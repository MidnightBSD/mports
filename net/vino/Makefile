PORTNAME=	vino
PORTVERSION=	3.22.0
PORTREVISION=	1
CATEGORIES=	net gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC server that allows for remote access to your GNOME desktop

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgnutls.so:security/gnutls \
		libtelepathy-glib.so:net-im/telepathy-glib \
		libdbus-glib-1.so:devel/dbus-glib \
		libsecret-1.so:security/libsecret \
		libgpg-error.so:security/libgpg-error \
		libgcrypt.so:security/libgcrypt \
		libdbus-1.so:devel/dbus \
		libsoup-2.4.so:devel/libsoup \
		libnotify.so:devel/libnotify \
		libavahi-glib.so:net/avahi-app

PORTSCOUT=	limitw:1,even

USES=		cpe gettext gmake gnome jpeg localbase pathfix \
		pkgconfig tar:xz xorg
CPE_VENDOR=	david_king
USE_GNOME=	cairo gtk30 intlhack
USE_XORG=	ice x11 xdamage xext xfixes sm xtst
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-Wno-format-nonliteral
GLIB_SCHEMAS=	org.gnome.Vino.enums.xml org.gnome.Vino.gschema.xml

post-install:
	@${RM} -rf ${STAGEDIR}${PREFIX}/lib/systemd/

.include <bsd.port.mk>
