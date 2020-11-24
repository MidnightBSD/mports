# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>

PORTNAME=	gnome-search-tool
PORTVERSION=	3.6.0
PORTREVISION=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 file search utilities

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool

CONFLICTS=	gnome-utils-2.[0-9]*

USES=		gettext gmake gnome pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix gtk30 intlhack
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GLIB_SCHEMAS=	org.gnome.gnome-search-tool.gschema.xml

.include <bsd.port.mk>
