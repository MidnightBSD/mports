# $MidnightBSD$

PORTNAME=	libgfortran
PORTVERSION=	4.8.5
PORTREVISION=	3
CATEGORIES=	devel linux
SRC_DISTFILES=	gcc-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Runtime libraries for gfortran (Linux Centos ${LINUX_DIST_VER})

LICENSE=	gpl3

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

RPMVERSION=	16.el7_4.2
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

.include <bsd.port.mk>
