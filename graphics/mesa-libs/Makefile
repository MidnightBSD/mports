PORTNAME=	mesa-libs
PORTVERSION=	${MESAVERSION}
CATEGORIES=	graphics

COMMENT=	OpenGL libraries that support GLX and EGL clients
WWW=		https://www.mesa3d.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/docs/license.rst

USES=		llvm:lib,noexport

BUILD_DEPENDS=	libglvnd>=0:graphics/libglvnd \
		${PYTHON_PKGNAMEPREFIX}ply>0:devel/py-ply@${PY_FLAVOR}

OPTIONS_GROUP=		PLATFORM
OPTIONS_GROUP_PLATFORM=	X11 WAYLAND
X11_DESC=		Enable X11 support for GBM/EGL
WAYLAND_DESC=		Enable Wayland support for GBM/EGL
WAYLAND_BUILD_DEPENDS=	wayland-protocols>=1.8:graphics/wayland-protocols
WAYLAND_LIB_DEPENDS=	libwayland-server.so:graphics/wayland

OPTIONS_DEFINE=		ZSTD
OPTIONS_DEFAULT=	WAYLAND X11 ZSTD
OPTIONS_SUB=		yes

ZSTD_DESC=		Use ZSTD for shader cache
ZSTD_LIB_DEPENDS=	libzstd.so:archivers/zstd
ZSTD_MESON_ENABLED=	zstd

USE_LDCONFIG=		yes

.include <bsd.mport.options.mk>
.include "${.CURDIR:H:H}/graphics/mesa-dri/Makefile.common"

MESON_ARGS+=	-Dandroid-libbacktrace=disabled \
		-Dgallium-omx=disabled \
		-Dgallium-va=disabled \
		-Dgallium-xa=disabled \
		-Dgallium-nine=false \
		-Dlmsensors=disabled \
		-Dmicrosoft-clc=disabled \
		-Dosmesa=false \
		-Dtools="" \
		-Dvalgrind=disabled \
		-Degl=enabled \
		-Dgbm=enabled \
		-Dvulkan-drivers="" \
		-Dglvnd=enabled

# Since mesa 24.2 the gallium drivers are linked into a single
# libgallium-${MESAVERSION}.so which libEGL_mesa, libGLX_mesa and libgbm
# link directly, so this port owns it and must build the full driver set.
# graphics/mesa-dri installs the lib/dri/*_dri.so loader shims on top.
# Keep this list in sync with OPTIONS_GROUP_GALLIUM in graphics/mesa-dri.
GALLIUM_DRIVERS=	crocus i915 iris panfrost r300 r600 radeonsi svga swrast zink
.if ${ARCH} != aarch64
GALLIUM_DRIVERS:=	${GALLIUM_DRIVERS:Npanfrost}
.endif
.if ${ARCH} != amd64 && ${ARCH} != i386
GALLIUM_DRIVERS:=	${GALLIUM_DRIVERS:Ncrocus:Ni915:Niris:Nsvga}
.endif
.if ${ARCH} == armv7
GALLIUM_DRIVERS=	swrast
.endif
MESON_ARGS+=	-Dgallium-drivers=${GALLIUM_DRIVERS:ts,}

.if ${GALLIUM_DRIVERS:Miris}
BUILD_DEPENDS+=	libclc-${LLVM_PORT:T}>0:devel/libclc@${LLVM_PORT:T} \
		spirv-tools>0:graphics/spirv-tools \
		spirv-llvm-translator-${LLVM_PORT:T}>0:devel/spirv-llvm-translator@${LLVM_PORT:T}
CONFIGURE_ENV+=	PKG_CONFIG_PATH="${LLVM_PREFIX}/libdata/pkgconfig"
.endif

# The VDPAU frontend is linked into libgallium too; the lib/vdpau/*.so
# symlinks pointing at it are packaged by graphics/mesa-gallium-vdpau.
.if ${PORT_OPTIONS:MX11} && (${GALLIUM_DRIVERS:Mr600} || ${GALLIUM_DRIVERS:Mradeonsi})
BUILD_DEPENDS+=	libvdpau>=0:multimedia/libvdpau
MESON_ARGS+=	-Dgallium-vdpau=enabled
.else
MESON_ARGS+=	-Dgallium-vdpau=disabled
.endif

PLIST_SUB+=	MESAVERSION=${MESAVERSION}

.if ${PORT_OPTIONS:MX11}
MESA_PLATFORMS+=	x11
USE_XORG+=		xorgproto x11 xcb xdamage xext \
			xfixes xshmfence xxf86vm xrandr
PLIST_SUB+=		GLX=""
.else
MESON_ARGS+=	-Dglx=disabled -Dxlib-lease=disabled
PLIST_SUB+=	GLX="@comment "
.endif

.if ${PORT_OPTIONS:MWAYLAND}
MESA_PLATFORMS+=	wayland
.endif

MESON_ARGS+=	-Dplatforms="${MESA_PLATFORMS:ts,:tl}"

.if ${ARCH} != amd64
MESON_ARGS+=	-Dintel-rt=disabled # https://gitlab.freedesktop.org/mesa/mesa/-/issues/10629
.endif

.if ${ARCH} == "i386"
# PR230239 Fix the build for i386 when WITH_LLD_IS_LD is set
LDFLAGS+=-Wl,-z,notext
.endif

post-install:
# Fallback if GLX_EXT_libglvnd is missing or vendor library doesn't exist
	@${ECHO_CMD} "libGLX_indirect.so.0 libGLX_mesa.so.0" \
		>${PREFIX}/etc/libmap.d/mesa.conf
# The lib/dri/*_dri.so shims, dri.pc and dri_interface.h belong to
# graphics/mesa-dri.
	${RM} -r ${PREFIX}/lib/dri ${PREFIX}/lib/vdpau

.include <bsd.port.post.mk>
