PORTNAME=	nvidia-drm-kmod
PORTVERSION=	${NVIDIA_DISTVERSION}
CATEGORIES=	graphics kld

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NVIDIA DRM Kernel Module
WWW=		https://www.nvidia.com/object/unix.html

USES=		metaport

BROKEN_MidnightBSD_2.0=      too old
BROKEN_MidnightBSD_2.1=      too old
BROKEN_MidnightBSD_2.2=      too old
BROKEN_MidnightBSD_3.0=      too old
BROKEN_MidnightBSD_3.1=      too old
BROKEN_MidnightBSD_3.2=      too old

.include "${.CURDIR}/../../x11/nvidia-driver/Makefile.version"
.include <bsd.port.pre.mk>

RUN_DEPENDS+=  ${KMODDIR}/nvidia-drm.ko:graphics/nvidia-drm-510-kmod

.include <bsd.port.post.mk>
