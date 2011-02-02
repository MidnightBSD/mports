# $MidnightBSD: mports/x11-wm/metacity/Makefile,v 1.7 2011/01/15 03:54:32 laffer1 Exp $
# $FreeBSD: ports/x11-wm/metacity/Makefile,v 1.57 2007/06/19 04:38:36 marcus Exp $

PORTNAME=	metacity
PORTVERSION=	2.30.1
CATEGORIES=	x11-wm
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A window manager for the adult in you
LICENSE=	gpl2

BUILD_DEPENDS=	zenity:${PORTSDIR}/x11/zenity
LIB_DEPENDS=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification \
		canberra-gtk.0:${PORTSDIR}/audio/libcanberra
RUN_DEPENDS=	zenity:${PORTSDIR}/x11/zenity

USE_BZIP2=	yes
USE_XORG=	x11 xcomposite xdamage
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomeprefix intlhack gnomehack gconf2 ltverhack gtk20
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
MAKE_ENV=	G_CHARSET_ALIAS="${LOCALBASE}/libdata/charset.alias"

GCONF_SCHEMAS=	metacity.schemas

MAN1=		metacity-message.1 metacity-theme-viewer.1 \
		metacity-window-demo.1 metacity.1

post-patch:
	@${REINPLACE_CMD} -e 's|-Werror||g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
