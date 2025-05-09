PORTNAME=	wlroots
DISTVERSION=	0.16.2
PORTREVISION=	3
CATEGORIES=	x11-toolkits
PKGNAMESUFFIX=	016

PATCH_SITES+=	https://github.com/swaywm/${GL_PROJECT}/commit/:github
PATCHFILES+=	107f8d4cca76.patch:-p1:github # https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4488
PATCH_SITES+=	${GL_SITE}/${GL_ACCOUNT}/${GL_PROJECT}/-/commit/
PATCHFILES+=	f3ba14e49133.patch:-p1 # https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3850
PATCHFILES+=	faa631c348d9.patch:-p1 # https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4005
PATCHFILES+=	822eb07eaca3.patch:-p1 # https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4005
PATCHFILES+=	4b4f76cc1357.patch:-p1 # https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4614

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modular Wayland compositor library (deprecated 0.16.* series)
WWW=		https://gitlab.freedesktop.org/wlroots/wlroots

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	wayland-protocols>=1.27:graphics/wayland-protocols
LIB_DEPENDS=	libudev.so:devel/libudev-devd \
		libdrm.so:graphics/libdrm \
		libwayland-server.so:graphics/wayland \
		libseat.so:sysutils/seatd \
		libxkbcommon.so:x11/libxkbcommon

USES=		compiler:c11 gl meson pkgconfig xorg
USE_GITLAB=	yes
USE_GL=		gbm
USE_XORG=	pixman
USE_LDCONFIG=	yes
GL_SITE=	https://gitlab.freedesktop.org
MESON_ARGS=	-Dexamples=false -Dbackends=${BACKENDS:ts,} -Drenderers=${RENDERERS:ts,}
PLIST_SUB=	SUFFIX=-${DISTVERSION:R}

PORTSCOUT=	limit:^0\.16\.

OPTIONS_DEFINE=	DRM OPENGL VULKAN X11
OPTIONS_DEFAULT=DRM OPENGL VULKAN X11
OPTIONS_SUB=	yes

DRM_DESC=		KMS console support
DRM_BUILD_DEPENDS=	hwdata>0:misc/hwdata
DRM_LIB_DEPENDS=	libinput.so:x11/libinput
DRM_VARS=		BACKENDS+="drm libinput"

OPENGL_RUN_DEPENDS=	mesa-dri>0:graphics/mesa-dri
OPENGL_USE=		GL=egl,glesv2
OPENGL_VARS=		RENDERERS+=gles2

VULKAN_DESC=		Vulkan renderer
VULKAN_BUILD_DEPENDS=	glslangValidator:graphics/glslang \
			vulkan-headers>0:graphics/vulkan-headers
VULKAN_LIB_DEPENDS=	libvulkan.so:graphics/vulkan-loader
VULKAN_RUN_DEPENDS=	mesa-dri>0:graphics/mesa-dri
VULKAN_VARS=		RENDERERS+=vulkan

X11_LIB_DEPENDS=	libxcb-errors.so:x11/xcb-util-errors \
			libxcb-render-util.so:x11/xcb-util-renderutil \
			libxcb-icccm.so:x11/xcb-util-wm
X11_BUILD_DEPENDS=	evdev-proto>0:devel/evdev-proto \
			Xwayland:x11-servers/xwayland
X11_RUN_DEPENDS=	Xwayland:x11-servers/xwayland
X11_USE=		XORG=xcb
X11_MESON_ENABLED=	xwayland
X11_VARS=		BACKENDS+=x11

post-patch:
# Extract (snapshot) version from the port instead of meson.build
	@${REINPLACE_CMD} "/STR/s/meson.project_version()/'${DISTVERSIONFULL}'/" \
		${WRKSRC}/include/wlr/meson.build

.include <bsd.port.mk>
