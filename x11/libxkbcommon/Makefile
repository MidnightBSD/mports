PORTNAME=	libxkbcommon
DISTVERSIONPREFIX=	xkbcommon-
DISTVERSION=	1.13.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Keymap handling library for toolkits and window systems
WWW=		https://xkbcommon.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	xkeyboard-config>0:x11/xkeyboard-config
RUN_DEPENDS=	xkeyboard-config>0:x11/xkeyboard-config

USES=		bison compiler:c11 cpe gnome meson pkgconfig python:test \
		shebangfix
USE_GNOME=	libxml2
USE_GITHUB=	yes
GH_ACCOUNT=	xkbcommon
USE_LDCONFIG=	yes
SHLIB_VERSION=	${DISTVERSION:S/^1./0./}
PLIST_SUB=	SHLIB_VERSION=${SHLIB_VERSION}
MESON_ARGS=	-Denable-docs=false \
		-Dx-locale-root="${PREFIX}/lib/X11/locale" \
		${MESON_ARGS_${OPSYS}_${OSREL:R}}
CPE_VENDOR=	xkbcommon
SHEBANG_FILES=	test/xkeyboard-config-test.py.in \
		test/*.py

OPTIONS_DEFINE=	EVDEV WAYLAND X11
OPTIONS_DEFAULT=EVDEV WAYLAND X11
OPTIONS_SUB=	yes

EVDEV_DESC=		Interactive debugger for XKB keymaps for evdev
EVDEV_BUILD_DEPENDS=	evdev-proto>0:devel/evdev-proto
EVDEV_USES=		localbase

WAYLAND_BUILD_DEPENDS=	wayland-protocols>=1.12:graphics/wayland-protocols
WAYLAND_LIB_DEPENDS=	libwayland-client.so:graphics/wayland
WAYLAND_MESON_TRUE=	enable-wayland

X11_USES=	xorg
X11_USE=	XORG=xcb
X11_MESON_TRUE=	enable-x11

# Direct Meson test has one compose-locale failure resolving the test locale
# xx_YY.UTF-8 on MidnightBSD; retain the existing policy pending a fix.
NO_TEST=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MEVDEV} || ${PORT_OPTIONS:MWAYLAND} || ${PORT_OPTIONS:MX11}
PLIST_SUB+=	EVDEV_OR_WAYLAND_OR_X11=""
.else
PLIST_SUB+=	EVDEV_OR_WAYLAND_OR_X11="@comment "
.endif

.if ${PORT_OPTIONS:MWAYLAND} || ${PORT_OPTIONS:MX11}
PLIST_SUB+=	WAYLAND_OR_X11=""
.else
PLIST_SUB+=	WAYLAND_OR_X11="@comment "
.endif

.include <bsd.port.mk>
