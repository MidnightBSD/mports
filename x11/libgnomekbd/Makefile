# $MidnightBSD: mports/x11/libgnomekbd/Makefile,v 1.7 2011/05/28 06:23:34 laffer1 Exp $
# $FreeBSD: ports/x11/libgnomekbd/Makefile,v 1.7 2007/05/28 23:22:29 mezz Exp $

PORTNAME=	libgnomekbd
PORTVERSION=	2.32.0
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME keyboard shared library
LICENSE=	lgpl

LIB_DEPENDS=	xklavier.12:${PORTSDIR}/x11/libxklavier

USE_BZIP2=	yes
USE_GNOME=	gnomeprefix gnomehack ltverhack gconf2
USE_AUTOTOOLS=	libtool
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_GMAKE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	desktop_gnome_peripherals_keyboard_xkb.schemas

#post-patch:
#	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
#	    	's|-Werror||g'

.include <bsd.port.mk>
