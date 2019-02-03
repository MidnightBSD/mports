# $FreeBSD: ports/net/vino/Makefile,v 1.28 2008/05/29 22:04:10 marcus Exp $
# $MidnightBSD$

PORTNAME=	vino
PORTVERSION=	3.16.0
CATEGORIES=	net gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC server that allows for remote access to your GNOME desktop

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgnutls.so:${PORTSDIR}/security/gnutls \
		libtelepathy-glib.so:${PORTSDIR}/net-im/telepathy-glib \
		libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib \
		libsoup-2.4.so:${PORTSDIR}/devel/libsoup \
		libgnome-keyring.so:${PORTSDIR}/security/libgnome-keyring \
		libnotify.so:${PORTSDIR}/devel/libnotify \
		libavahi-glib.so:${PORTSDIR}/net/avahi-app

USES=		cpe gettext gmake pathfix pkgconfig tar:xz
CPE_VENDOR=	david_king
USE_GNOME=	gtk30 intlhack
USE_XORG=	xdamage xfixes xtst
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include -Wno-format-nonliteral
LDFLAGS+=	-L${LOCALBASE}/lib
GLIB_SCHEMAS=	org.gnome.Vino.enums.xml org.gnome.Vino.gschema.xml

.include <bsd.port.mk>
