PORTNAME=	gnome-font-viewer
PORTVERSION=	47.0
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME font viewer utility
WWW=		https://github.com/GNOME/gnome-font-viewer

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz \
		libfribidi.so:converters/fribidi

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 desktop-file-utils gettext gnome localbase meson \
		pkgconfig tar:xz
USE_LDCONFIG=	yes
USE_GNOME=	gtk40 libadwaita
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
