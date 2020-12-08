PORTNAME=	gnome-taquin
PORTVERSION=	3.38.1
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Move tiles so that they reach their places

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	vala:lang/vala \
		itstool:textproc/itstool
LIB_DEPENDS=	libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome localbase meson pathfix pkgconfig tar:xz xorg
USE_GNOME=	cairo gsound gtk30 intlhack librsvg2 libxml2:build
USE_XORG=	x11
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.Taquin.gschema.xml

.include <bsd.port.mk>
