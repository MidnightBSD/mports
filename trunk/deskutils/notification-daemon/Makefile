# $MidnightBSD$

PORTNAME=	notification-daemon
PORTVERSION=	0.7.2
PORTREVISION=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MindightBSD.org
COMMENT=	Send small notifications to your desktop

LICENSE=	gpl2

LIB_DEPENDS=	dbus-1.3:${PORTSDIR}/devel/dbus \
		canberra-gtk3.0:${PORTSDIR}/audio/libcanberra-gtk3

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix intlhack gtk30
USES=		gettext gmake pkgconfig
USE_XORG=	x11
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-dbus-services=${PREFIX}/share/dbus-1/services
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFLICTS=	xfce4-notification-daemon-[0-9]* xfce4-notifyd-[0-9]*

.include <bsd.port.mk>
