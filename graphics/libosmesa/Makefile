PORTNAME=	libosmesa
PORTVERSION=	${MESAVERSION}
PORTREVISION=	1
CATEGORIES=	graphics

COMMENT=	Off-Screen Mesa implementation of the OpenGL API
WWW=		https://www.mesa3d.org/

LICENSE=	mit

LIB_DEPENDS+=	libglapi.so:graphics/mesa-libs

USES=		llvm:lib,noexport xorg
USE_XORG=	xorgproto
USE_LDCONFIG=	yes

.include <bsd.mport.options.mk>
.include "${.CURDIR:H:H}/graphics/mesa-dri/Makefile.common"

# Disable some options
MESON_ARGS+=	-Dgallium-drivers="swrast" \
		-Dvulkan-drivers="" \
		-Dplatforms="" \
		-Dandroid-libbacktrace=disabled \
		-Dgallium-vdpau=disabled \
		-Dgallium-omx=disabled \
		-Dgallium-va=disabled \
		-Dgallium-opencl=disabled \
		-Dgallium-xa=disabled \
		-Dgallium-nine=false \
		-Dgles1=disabled \
		-Dgles2=disabled \
		-Dlmsensors=disabled \
		-Dmicrosoft-clc=disabled \
		-Dopengl=true \
		-Dglx=disabled \
		-Degl=disabled \
		-Dgbm=disabled \
		-Dtools="" \
		-Dvalgrind=disabled \
		-Dxlib-lease=disabled \
		-Dzstd=disabled
LDFLAGS_i386=		-Wl,-znotext

MESON_ARGS+=	-Dosmesa=true

.include "${MASTERDIR}/Makefile.targets"

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/include/GL
	${INSTALL_DATA} ${WRKSRC}/include/GL/osmesa.h \
		${STAGEDIR}${PREFIX}/include/GL

.include <bsd.port.post.mk>
