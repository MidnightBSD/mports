# $MidnightBSD: mports/x11/yelp/Makefile,v 1.14 2011/05/07 20:48:56 laffer1 Exp $

PORTNAME=	yelp
PORTVERSION=	2.30.2
PORTREVISION=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A help browser for the GNOME 2 desktop
LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
		startup-notification-1.0:${PORTSDIR}/x11/startup-notification \
    		rarian.0:${PORTSDIR}/textproc/rarian

USE_GECKO=	libxul
USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_XORG=	ice
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gconf2 gnomedocutils
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-gecko=${GECKO} \
		--with-gecko-home=${LOCALBASE}/lib/${GECKO}
MAKE_ENV=	G_CHARSET_ALIAS="${LOCALBASE}/libdata/charset.alias"

GCONF_SCHEMAS=	yelp.schemas

.include <bsd.port.pre.mk>

post-extract:
	${RM} -f ${WRKSRC}/data/yelp.schemas

.include <bsd.port.post.mk>
