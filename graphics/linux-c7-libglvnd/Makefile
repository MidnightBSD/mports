PORTNAME=	libglvnd
PORTVERSION=	1.0.1
DISTVERSIONSUFFIX=	-0.8.git5baa1e5.el7
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GL Vendor-Neutral Dispatch library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	other

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	xorglibs
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	libglvnd-${DISTVERSIONFULL} \
		libglvnd-egl-${DISTVERSIONFULL} \
		libglvnd-gles-${DISTVERSIONFULL} \
		libglvnd-glx-${DISTVERSIONFULL} \
		libglvnd-opengl-${DISTVERSIONFULL}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
