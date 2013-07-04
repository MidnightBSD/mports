# $MidnightBSD: mports/accessibility/gok/Makefile,v 1.8 2013/03/24 19:16:49 laffer1 Exp $

PORTNAME=	gok
PORTVERSION=	2.30.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	accessibility sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME On-Screen Keyboard (GOK)
LICENSE=	lgpl

LIB_DEPENDS=	canberra-gtk.0:${PORTSDIR}/audio/libcanberra \
    		dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_BZIP2=	yes
USES=		gettext
INSTALLS_OMF=	yes
USE_GNOME=	gnomehack gnomeprefix intlhack libgnomeui atspi libwnck \
		gnomespeech libxml2
USE_GMAKE=	yes
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	gok.schemas

.include <bsd.port.mk>
