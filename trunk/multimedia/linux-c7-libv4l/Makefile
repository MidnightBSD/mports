# $MidnightBSD$ 

PORTNAME=	libv4l
PORTVERSION=	0.9.5
CATEGORIES=	multimedia linux
SRC_DISTFILES=	v4l-utils-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video4Linux library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	4.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
