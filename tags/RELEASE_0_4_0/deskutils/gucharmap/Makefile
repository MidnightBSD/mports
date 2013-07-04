# $MidnightBSD: mports/deskutils/gucharmap/Makefile,v 1.5 2009/10/31 23:48:42 laffer1 Exp $

PORTNAME=	gucharmap
PORTVERSION=	2.30.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Unicode/ISO10646 character map and font viewer
LICENSE=	gpl2

LIB_DEPENDS=	rarian.0:${PORTSDIR}/textproc/rarian

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack gtk20 gnomedocutils gconf2
WANT_GNOME=	yes
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
	       	LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gucharmap.schemas

.include <bsd.port.mk>
