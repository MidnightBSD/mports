PORTNAME=	nvidia-hybrid-graphics
PORTVERSION=	0.6
CATEGORIES=	x11
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NVIDIA secondary GPU configuration - Optimus Technology support
WWW=		https://github.com/therontarigo/freebsd-gpu-headless

LICENSE=	bsd2

RUN_DEPENDS=	nvidia-xconfig:x11/nvidia-xconfig \
		${LOCALBASE}/bin/Xorg:x11-servers/xorg-server@xorg

FLAVORS=	default 390

NO_ARCH=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/src

default_RUN_DEPENDS=	\
	nvidia-secondary-driver>=440.64:x11/nvidia-secondary-driver
390_RUN_DEPENDS=	\
	nvidia-secondary-driver-390>=390.87:x11/nvidia-secondary-driver-390

VIRTUALGL_RUN_DEPENDS=	${LOCALBASE}/VirtualGL/bin/vglrun:x11/virtualgl

390_PKGNAMESUFFIX=	-390

OPTIONS_DEFINE=		VIRTUALGL OPTIRUN
OPTIONS_DEFAULT=	VIRTUALGL OPTIRUN
OPTIONS_SUB=		OPTIRUN
VIRTUALGL_DESC=		Use VirtualGL for OpenGL redirection support
OPTIRUN_DESC=		Install "optirun" alias for nvrun-vgl
OPTIRUN_IMPLIES=	VIRTUALGL

scripts=	\
	bin/Xorg-nvidia-headless \
	bin/nvidia-headless-xconfig \
	bin/nvrun \
	bin/nvrun-vgl \
	libexec/nvidia-headless-utils/readconf \
	libexec/nvidia-settings-hybrid
configs=	\
	etc/X11/xorg-nvidia-headless-template.conf \
	etc/nvidia-headless.conf \
	etc/nvidia-hybrid.conf \

SUB_FILES=	pkg-message ${scripts:%=src/%} ${configs:%=src/%}
SUB_LIST+=	VGLRUN=${LOCALBASE}/VirtualGL/bin/vglrun

USE_RC_SUBR=	nvidia_xorg

do-extract:
.for f in ${SUB_FILES}
	${MKDIR} ${WRKDIR}/${f:H}
.endfor

do-install:
.for f in ${scripts}
	@${MKDIR} ${PREFIX}/${f:H}
	${INSTALL_SCRIPT} ${WRKSRC}/${f} ${PREFIX}/${f}
.endfor
.for f in ${configs}
	@${MKDIR} ${PREFIX}/${f:H}
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/${f}.sample
.endfor

post-install:
	@${MKDIR} ${PREFIX}/etc/X11/xorg-nvidia-headless.conf.d

post-install-OPTIRUN-on:
	@${RLN} ${FAKE_DESTDIR}${PREFIX}/bin/nvrun-vgl \
		${FAKE_DESTDIR}${PREFIX}/bin/optirun

.include <bsd.port.mk>
