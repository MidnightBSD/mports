PORTNAME=	libxkbcommon
PORTVERSION=	0.8.4
CATEGORIES=	x11
MASTER_SITES=	https://xkbcommon.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Keymap handling library for toolkits and window systems

LICENSE=	mit

RUN_DEPENDS=	xkeyboard-config>0:x11/xkeyboard-config

XORG_CAT=	lib
USES=		gmake bison tar:xz xorg xorg-cat:lib

USE_XORG=	xcb
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--without-doxygen \
		--with-default-rules="xorg" \
		--with-x-locale-root=${PREFIX}/lib/X11/locale \
		--disable-wayland

.include <bsd.port.mk>
