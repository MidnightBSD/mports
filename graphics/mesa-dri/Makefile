# Created by: Eric Anholt <anholt@FreeBSD.org>
# $FreeBSD: head/graphics/mesa-dri/Makefile 533793 2020-05-03 16:15:23Z zeising $

PORTNAME=	mesa-dri
PORTVERSION=	${MESAVERSION}
CATEGORIES=	graphics

COMMENT=	OpenGL hardware acceleration drivers for DRI2+

USES=		xorg
USE_XORG=	xorgproto x11 xdamage xext xfixes xshmfence xv xvmc

OPTIONS_DEFINE=	VAAPI VDPAU WAYLAND
OPTIONS_DEFAULT=WAYLAND
OPTIONS_SUB=	yes

VAAPI_CONFIGURE_ENABLE=	va
VAAPI_LIB_DEPENDS=	libva.so:multimedia/libva
VAAPI_USE=		XORG=xcb

VDPAU_CONFIGURE_ENABLE=	vdpau
VDPAU_LIB_DEPENDS=	libvdpau.so:multimedia/libvdpau

WAYLAND_DESC=		Enable support for the Wayland platform in Vulkan drivers
WAYLAND_BUILD_DEPENDS=	wayland-protocols>=1.8:graphics/wayland-protocols
WAYLAND_LIB_DEPENDS=	libwayland-client.so:graphics/wayland

.include <bsd.mport.options.mk>
.include "${.CURDIR:H:H}/graphics/mesa-dri/Makefile.common"

USES+=	compiler:c++17-lang
CC=     clang70                                                                                                                                                           
MAKE_ENV+=      CC=clang70 __FreeBSD__=10
LLVM_DEFAULT=   70
BUILD_DEPENDS+= llvm${LLVM_DEFAULT}>=3.9.0_4:devel/llvm${LLVM_DEFAULT}                                                                                                    
RUN_DEPENDS+=   llvm${LLVM_DEFAULT}>=3.9.0_4:devel/llvm${LLVM_DEFAULT}                                                                                                    
CONFIGURE_ENV+= LLVM_CONFIG=${LOCALBASE}/bin/llvm-config${LLVM_DEFAULT}                                                                                                   
LDFLAGS+=       -Wl,-rpath=${LOCALBASE}/llvm${LLVM_DEFAULT}/lib  

ALL_DRI_DRIVERS=	I915 I965 RADEON R200 SWRAST
ALL_GALLIUM_DRIVERS=	FREEDRENO R300 R600 RADEONSI SVGA SWRAST VC4
ALL_VULKAN_DRIVERS=	INTEL RADEON

DRI_DRIVERS=		SWRAST	# classic swrast
.if ${ARCH} == aarch64 || ${ARCH} == amd64 || ${ARCH:Marm*} || ${ARCH} == i386 || ${ARCH:Mmips*} || ${ARCH:Mpowerpc*}
GALLIUM_DRIVERS=	SWRAST	# llvmpipe
.else
GALLIUM_DRIVERS=	""
.endif
VULKAN_DRIVERS=		#

.if ${ARCH} == aarch64 || ${ARCH} == amd64 || ${ARCH} == i386 \
 || ${ARCH} == powerpc || ${ARCH} == powerpc64
DRI_DRIVERS+=		RADEON R200
GALLIUM_DRIVERS+=	R300 R600 RADEONSI
VULKAN_DRIVERS+=	RADEON
.endif
.if ${ARCH} == amd64 || ${ARCH} == i386
DRI_DRIVERS+=		I915 I965
GALLIUM_DRIVERS+=	SVGA
EXTRA_PATCHES+=	${PATCHDIR}/extra-src_mesa_drivers_dri_i965_intel__screen.c
VULKAN_DRIVERS+=	INTEL
.elif ${ARCH} == aarch64 || ${ARCH} == armv6 || ${ARCH} == armv7
GALLIUM_DRIVERS+=	FREEDRENO VC4
. if ${ARCH} == armv6 || ${ARCH} == armv7
EXTRA_PATCHES+=	${PATCHDIR}/extra-src_gallium_drivers_vc4_Makefile.in
. endif
.endif

.if ${VULKAN_DRIVERS}
BUILD_DEPENDS+=		${PYTHON_PKGNAMEPREFIX}mako>0:textproc/py-mako@${PY_FLAVOR}
USE_XORG+=		xcb xrandr
.endif

LDFLAGS_i386=		-Wl,-znotext
.if ${DRI_DRIVERS} || ${VULKAN_DRIVERS:MINTEL}
. if ${/usr/bin/ld:L:tA} != /usr/bin/ld.lld
# --build-id isn't supported by old GNU ld.bfd in base
USE_BINUTILS=		yes
LDFLAGS+=		-B${LOCALBASE}/bin
. endif
.endif

# enables VK_KHR_wayland_surface in Vulkan drivers
.if ${PORT_OPTIONS:MWAYLAND} && !empty(VULKAN_DRIVERS)
CONFIGURE_ARGS+=	--with-platforms=x11,surfaceless,drm,wayland
.endif

CONFIGURE_ARGS+=	--with-dri-drivers="${DRI_DRIVERS:tl}" \
			--with-gallium-drivers="${GALLIUM_DRIVERS:tl}" \
			--with-vulkan-drivers="${VULKAN_DRIVERS:tl}"
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

.for _d in ${ALL_DRI_DRIVERS}
. if ${DRI_DRIVERS:M${_d}}
PLIST_SUB+=	${_d}_DRIVER=""
. else
PLIST_SUB+=	${_d}_DRIVER="@comment "
. endif
.endfor

.for _gd in ${ALL_GALLIUM_DRIVERS}
. if ${GALLIUM_DRIVERS:M${_gd}}
PLIST_SUB+=	${_gd}_GDRIVER=""
. else
PLIST_SUB+=	${_gd}_GDRIVER="@comment "
. endif
.endfor

.for _vd in ${ALL_VULKAN_DRIVERS}
. if ${VULKAN_DRIVERS:M${_vd}}
PLIST_SUB+=	${_vd}_VDRIVER="" ARCH="${ARCH}"
. else
PLIST_SUB+=	${_vd}_VDRIVER="@comment "
. endif
.endfor

.include "${MASTERDIR}/Makefile.targets"

post-install:
	@${RM} -r ${STAGEDIR}/etc/OpenCL

.include <bsd.port.post.mk>
