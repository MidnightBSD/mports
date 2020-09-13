PORTNAME=	xorg
PORTVERSION=	7.5.2
PORTREVISION=	2
CATEGORIES=	x11 x11-servers
MASTER_SITES=	# none
PKGNAMESUFFIX=	-minimal
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org minimal distribution metaport

LICENSE=	agg

NO_BUILD=	yes
NO_MTREE=	yes

.include <bsd.mport.options.mk>

VIDEO_DRIVER?=	vesa

RUN_DEPENDS+=	${LOCALBASE}/bin/Xorg:x11-servers/xorg-server \
		${LOCALBASE}/lib/xorg/modules/input/mouse_drv.so:x11-drivers/xf86-input-mouse \
		${LOCALBASE}/lib/xorg/modules/input/kbd_drv.so:x11-drivers/xf86-input-keyboard \
		${LOCALBASE}/bin/xinit:x11/xinit \
		${LOCALBASE}/bin/xauth:x11/xauth
.if ${VIDEO_DRIVER} == "nvidia"
RUN_DEPENDS+=	${LOCALBASE}/lib/xorg/modules/drivers/nvidia_drv.so:x11/nvidia-driver
.elif ${VIDEO_DRIVER} == "intel29"
RUN_DEPENDS+=	${LOCALBASE}/lib/xorg/modules/drivers/intel_drv.so:x11-drivers/xf86-video-${VIDEO_DRIVER}
.else
RUN_DEPENDS+=	${LOCALBASE}/lib/xorg/modules/drivers/${VIDEO_DRIVER}_drv.so:x11-drivers/xf86-video-${VIDEO_DRIVER}
.endif

.if ${VIDEO_DRIVER} == intel
RUN_DEPENDS+=	${LOCALBASE}/lib/va/i965_drv_video.so:multimedia/libva-intel-driver
RUN_DEPENDS+= ${LOCALBASE}/lib/xorg/modules/drivers/${VIDEO_DRIVER}_drv.so:x11-drivers/xf86-video-${VIDEO_DRIVER}
.endif

do-install:

.include <bsd.port.mk>
