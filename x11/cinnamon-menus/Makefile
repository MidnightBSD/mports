# Created by: Gustau Perez i Querol <gustau.perez@gmail.com>

PORTNAME=	cinnamon-menus
PORTVERSION=	4.8.2
CATEGORIES=	x11 gnome
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for cinnamon

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.LIB

USES=		gnome meson pkgconfig

USE_GNOME=	glib20 introspection:build

USE_GITHUB=	yes
GH_ACCOUNT=	linuxmint

USE_LDCONFIG=	yes

.include <bsd.port.mk>
