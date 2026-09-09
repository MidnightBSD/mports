PORTNAME=	mate-menus
DISTVERSION=	1.28.1
CATEGORIES=	x11 mate
MASTER_SITES=	https://github.com/mate-desktop/${PORTNAME}/releases/download/v${DISTVERSION}/
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the FreeDesktop Desktop Menu Spec
WWW=		https://mate-desktop.org/

LICENSE=	gpl2 lgpl
LICENSE_COMB=	dual

USES=		gettext gmake gnome libtool localbase pathfix pkgconfig \
		python tar:xz
USE_GNOME=	glib20 intltool introspection:build
USE_LDCONFIG=	yes
PORTSCOUT=	site:https://github.com/mate-desktop/mate-menus/releases/ limitw:1,even
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
