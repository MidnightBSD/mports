# $MidnightBSD$

PORTNAME=	jasper
PORTVERSION=	1.900.1
CATEGORIES=	graphics linux
PKGNAMESUFFIX=	-libs
LIB_DISTNAMES=	${LINUXNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JPEG-2000 reference implementation (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	mit

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
LINUXNAME=	${PORTNAME}${PKGNAMESUFFIX}
RPMVERSION=	22.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	jpeg
USE_LINUX_RPM=	yes

.include <bsd.port.mk>
