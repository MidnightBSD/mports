PORTNAME=	cinnamon-menus
PORTVERSION=	5.4.0
CATEGORIES=	x11 gnome
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for cinnamon
WWW=		https://github.com/linuxmint/cinnamon-menus

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
