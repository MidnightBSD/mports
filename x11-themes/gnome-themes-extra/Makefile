PORTNAME=	gnome-themes-extra
PORTVERSION=	3.28
PORTREVISION=	2
CATEGORIES=	x11-themes gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard themes for GNOME

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS=	gnome-themes-2.[0-9]*
PORTSCOUT=	limitw:1,even

LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig

USES=		gettext-tools gmake gnome libtool pathfix pkgconfig tar:xz
USE_GNOME=	cairo gtk20 intltool gtk30 librsvg2
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
