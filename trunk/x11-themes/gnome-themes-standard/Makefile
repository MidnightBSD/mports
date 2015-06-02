# $MidnightBSD$

PORTNAME=	gnome-themes-standard
PORTVERSION=	3.14.2.3
CATEGORIES=	x11-themes gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard themes for GNOME

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

CONFLICTS=	gnome-themes-2.[0-9]*

USES=		gettext-tools gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix gtk30 intlhack librsvg2
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
