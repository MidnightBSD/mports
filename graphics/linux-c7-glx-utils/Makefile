# $MidnightBSD$

PORTNAME=	glx-utils
PORTVERSION=	8.2.0
CATEGORIES=	graphics linux
SRC_DISTFILES=	mesa-demos-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mesa GLX utilities (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	unknown

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

RPMVERSION=	3.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	dri xorglibs
USE_LINUX_RPM=	nolib

.include <bsd.port.mk>
