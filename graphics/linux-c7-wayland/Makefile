PORTNAME=	wayland
PORTVERSION=	1.15.0
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wayland compositor libraries (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	mit

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	libwayland-client-${DISTVERSIONFULL} \
		libwayland-cursor-${DISTVERSIONFULL} \
		libwayland-egl-${DISTVERSIONFULL} \
		libwayland-server-${DISTVERSIONFULL}

DESCR=		${.CURDIR}/../wayland/pkg-descr

.include <bsd.port.mk>
