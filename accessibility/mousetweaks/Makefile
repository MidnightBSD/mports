# $MidnightBSD$

PORTNAME=	mousetweaks
PORTVERSION=	2.32.1
PORTREVISION=	2
CATEGORIES=	accessibility
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mouse accessibility enhancements for the GNOME desktop

LICENSE=	gpl3

USE_XORG=	x11 xfixes xcursor xtst
USE_GNOME=	gnomeprefix gnomepanel intlhack
USES=		gmake gettext pathfix pkgconfig tar:bzip2
INSTALLS_OMF=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	mousetweaks.schemas pointer-capture-applet.schemas

.include <bsd.port.mk>
