PORTNAME=	mesa-gallium-vdpau
PORTVERSION=	${MESAVERSION}
CATEGORIES=	graphics

COMMENT=	Mesa Gallium VDPAU drivers
WWW=		https://www.mesa3d.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/docs/license.rst

BUILD_DEPENDS=	libvdpau>=0:multimedia/libvdpau
LIB_DEPENDS=	libzstd.so:archivers/zstd

USES=		llvm:lib,noexport xorg
USE_XORG=	xorgproto x11 xcb xdamage xext xfixes xshmfence xxf86vm xrandr

# Mesa's VDPAU frontend requires the X11 platform, and libgallium on armv7
# is built with swrast only, which has no VDPAU support.
NOT_FOR_ARCHS=		armv7
NOT_FOR_ARCHS_REASON=	no VDPAU-capable gallium driver is built on this architecture

.include <bsd.mport.options.mk>
.include "${.CURDIR:H:H}/graphics/mesa-dri/Makefile.common"

MESON_ARGS+=	-Dgallium-drivers="r600,radeonsi" \
		-Dvulkan-drivers="" \
		-Dandroid-libbacktrace=disabled \
		-Dgallium-va=disabled \
		-Dgallium-omx=disabled \
		-Dgallium-xa=disabled \
		-Dgallium-opencl=disabled \
		-Dgallium-nine=false \
		-Dgbm=disabled \
		-Dgles1=disabled \
		-Dgles2=disabled \
		-Dglvnd=disabled \
		-Dlmsensors=disabled \
		-Dmicrosoft-clc=disabled \
		-Dosmesa=false \
		-Dvalgrind=disabled \
		-Dglx=disabled \
		-Ddri3=enabled

LDFLAGS_i386=	-Wl,-znotext

MESON_ARGS+=	-Dgallium-vdpau=enabled

.if ${ARCH} != amd64
MESON_ARGS+=	-Dintel-rt=disabled # https://gitlab.freedesktop.org/mesa/mesa/-/issues/10629
.endif

MESON_ARGS+=	-Dplatforms="x11"

# Since mesa 24.2 the lib/vdpau/*.so drivers are symlinks to
# libgallium-${MESAVERSION}.so, which graphics/mesa-libs builds with the
# VDPAU frontend and owns.
LIB_DEPENDS+=	libgallium-${MESAVERSION}.so:graphics/mesa-libs

# mesa-libs only builds the VDPAU frontend with its X11 option on; without
# it the symlinks installed here would point at a library with no VDPAU
# entry point.
pre-configure:
	@if ! ${READELF} -D -s ${LOCALBASE}/lib/libgallium-${MESAVERSION}.so | \
	    ${GREP} -q 'vdp_imp_device_create_x11$$'; then \
		${ECHO_MSG} "===> ${LOCALBASE}/lib/libgallium-${MESAVERSION}.so has no VDPAU frontend;"; \
		${ECHO_MSG} "===> rebuild graphics/mesa-libs with the X11 option enabled."; \
		${FALSE}; \
	fi

post-install:
	${RM} ${PREFIX}/lib/libgallium-${MESAVERSION}.so

.include <bsd.port.post.mk>
