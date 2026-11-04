PORTNAME=	gershwin-windowmanager
DISTVERSION=	20260129
CATEGORIES=	x11 gnustep

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gershwin window manager combining WindowManager and XCBKit
WWW=		https://github.com/gershwin-desktop/gershwin-windowmanager

LICENSE=	mit

LIB_DEPENDS=	libcairo.so:graphics/cairo \
		libxcb-cursor.so:x11/xcb-util-cursor \
		libxcb-icccm.so:x11/xcb-util-wm \
		libxcb-util.so:x11/xcb-util

USES=		gershwin pkgconfig xorg
USE_GERSHWIN=	back build
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
USE_XORG=	x11 xcb xcomposite xdamage xext xfixes xrender

USE_GITHUB=	yes
GH_ACCOUNT=	gershwin-desktop
GH_TAGNAME=	47b878f

.include <bsd.port.mk>
