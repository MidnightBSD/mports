PORTNAME=	clover
PORTVERSION=	${MESAVERSION}
PORTREVISION=	2
CATEGORIES=	lang

COMMENT=	Mesa OpenCL implementation for AMD GPUs
WWW=		https://dri.freedesktop.org/wiki/GalliumCompute/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/docs/license.rst

BUILD_DEPENDS=	libclc>=0.3.0:devel/libclc \
		opencl>=0:devel/opencl
LIB_DEPENDS=	libOpenCL.so:devel/ocl-icd \
		libLLVM-${LLVM_VERSION}.so:devel/${LLVM_PORT:T} \
		libzstd.so:archivers/zstd
RUN_DEPENDS=	libclc-${LLVM_PORT:T}>0:devel/libclc@${LLVM_PORT:T} \
		opencl>=0:devel/opencl

ONLY_FOR_ARCHS=		i386 amd64
ONLY_FOR_ARCHS_REASON=	Clover needs a GPU supported by the Radeon KMS driver

USES=	llvm:lib,max=16

.include <bsd.mport.options.mk>
.include "${.CURDIR:H:H}/graphics/mesa-dri/Makefile.common"

MESON_ARGS+=	-Dplatforms="" \
		-Dvulkan-drivers="" \
		-Dandroid-libbacktrace=disabled \
		-Dgallium-nine=false \
		-Dgallium-omx=disabled \
		-Dgallium-opencl=disabled \
		-Dgallium-va=disabled \
		-Dgallium-vdpau=disabled \
		-Dgallium-xa=disabled \
		-Dgles1=disabled \
		-Dgles2=disabled \
		-Dmicrosoft-clc=disabled \
		-Dopengl=false \
		-Dglx=disabled \
		-Degl=disabled \
		-Dgbm=disabled \
		-Dtools="" \
		-Dxlib-lease=disabled \
		-Dlmsensors=disabled \
		-Dvalgrind=disabled \
		-Dgallium-opencl=icd \
		-Dgallium-drivers=r600,radeonsi

LDFLAGS_i386=		-Wl,-znotext

.include "${MASTERDIR}/Makefile.targets"

.include <bsd.port.post.mk>
