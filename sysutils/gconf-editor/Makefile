PORTNAME=	gconf-editor
PORTVERSION=	3.0.1
PORTREVISION=	3
PORTEPOCH=	1
PORTREVISION=	2
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gconf database editor for the GNOME 3 environment

LICENSE=	gpl2

USES=		gettext gmake gnome pathfix pkgconfig tar:xz
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix intlhack gtk30 gconf2
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	gconf-editor.schemas

.include <bsd.port.mk>
