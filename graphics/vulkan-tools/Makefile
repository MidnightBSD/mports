PORTNAME=	vulkan-tools
DISTVERSIONPREFIX=	v
DISTVERSION=	1.4.316
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools and demos for the Vulkan graphics API
WWW=		https://github.com/KhronosGroup/Vulkan-Tools

LICENSE=	Apache-2.0

BUILD_DEPENDS=	glslangValidator:graphics/glslang \
		vulkan-headers>0:graphics/vulkan-headers

USES=		cmake compiler:c++11-lib pkgconfig python:build
USE_GITHUB=	yes
GH_ACCOUNT=	KhronosGroup
GH_PROJECT=	Vulkan-Tools
CMAKE_OFF=	BUILD_ICD
CMAKE_ARGS=	-DGLSLANG_INSTALL_DIR:PATH="${LOCALBASE}"

OPTIONS_DEFINE=		WAYLAND XCB XLIB
OPTIONS_DEFAULT=	WAYLAND XCB XLIB

WAYLAND_CATEGORIES=	wayland
WAYLAND_BUILD_DEPENDS=	evdev-proto>0:devel/evdev-proto \
			wayland-protocols>0:graphics/wayland-protocols
WAYLAND_LIB_DEPENDS=	libwayland-client.so:graphics/wayland
WAYLAND_CMAKE_BOOL=	BUILD_WSI_WAYLAND_SUPPORT

XCB_DESC=		${X11_DESC} via libxcb
XCB_USES=		xorg
XCB_USE=		XORG=xcb
XCB_CMAKE_BOOL=		BUILD_WSI_XCB_SUPPORT

XLIB_DESC=		${X11_DESC} via libX11
XLIB_USES=		xorg
XLIB_USE=		XORG=x11
XLIB_CMAKE_BOOL=	BUILD_WSI_XLIB_SUPPORT

.include <bsd.port.mk>
