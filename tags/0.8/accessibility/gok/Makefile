# $MidnightBSD$

PORTNAME=	gok
PORTVERSION=	2.30.1
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	accessibility sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME On-Screen Keyboard (GOK)
LICENSE=	lgpl

LIB_DEPENDS=	libcanberra-gtk.so:${PORTSDIR}/audio/libcanberra \
    		libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib

USES=		gmake gettext libtool pathfix pkgconfig tar:bzip2
INSTALLS_OMF=	yes
USE_GNOME=	gnomeprefix intlhack libgnomeui atspi libwnck \
		gnomespeech libxml2
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	gok.schemas

.include <bsd.port.mk>
