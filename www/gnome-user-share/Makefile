# $MidnightBSD: mports/www/gnome-user-share/Makefile,v 1.1 2010/09/06 19:59:55 laffer1 Exp $

PORTNAME=	gnome-user-share
PORTVERSION=	2.30.1
PORTREVISION=	0
CATEGORIES=	www deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Personal file-sharing service for the GNOME Desktop
LICENSE=	gpl2

LIB_DEPENDS=	avahi-client:${PORTSDIR}/net/avahi-app \
		canberra.0:${PORTSDIR}/audio/libcanberra \
		notify.1:${PORTSDIR}/devel/libnotify \
		unique-1.0.2:${PORTSDIR}/x11-toolkits/unique
RUN_DEPENDS=	${LOCALBASE}/${APACHEMODDIR}/mod_dnssd.so:${PORTSDIR}/www/mod_dnssd \
		console-kit-daemon:${PORTSDIR}/sysutils/consolekit

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_APACHE=	2.2+
USE_XORG=	sm
USE_GNOME=	gnomeprefix gnomehack intlhack gtk20 gconf2 gnomedocutils nautilus2
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ARGS=	--with-modules-path=${LOCALBASE}/${APACHEMODDIR}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	desktop_gnome_file_sharing.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/httpd/modules|${LOCALBASE}/${APACHEMODDIR}|g' \
		${WRKSRC}/data/dav_user_*.conf

.include <bsd.port.mk>
