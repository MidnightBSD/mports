PORTNAME=	nvidia-drm-kmod
DISTVERSION?=	${NVIDIA_DISTVERSION}
PORTREVISION?=	0
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

.  if ${OSVERSION} >= 400000
RUN_DEPENDS+=  ${KMODDIR}/nvidia-drm.ko:graphics/nvidia-drm-510-kmod${PKGNAMESUFFIX}
.  endif

RUN_DEPENDS+=  nvidia-driver${PKGNAMESUFFIX}>0:x11/nvidia-driver${PKGNAMESUFFIX}

CONFLICTS_INSTALL=	nvidia-drm-kmod*

.include <bsd.port.post.mk>
