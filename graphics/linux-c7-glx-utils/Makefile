PORTNAME=	glx-utils
PORTVERSION=	8.3.0
DISTVERSIONSUFFIX=	-10.el7
PORTREVISION=	1
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mesa GLX utilities (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.centos.org/

LICENSE=	mit

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	dri xorglibs
USE_LINUX_RPM=	yes

SRC_DISTFILES=	mesa-demos-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

.include <bsd.port.mk>
