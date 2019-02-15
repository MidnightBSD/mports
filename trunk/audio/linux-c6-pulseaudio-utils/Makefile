# $MidnightBSD$

PORTNAME=	pulseaudio
PORTVERSION=	0.9.21
CATEGORIES=	audio linux
PKGNAMESUFFIX=	-utils
LIB_DISTNAMES=	${LINUXNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utils for PulseAudio clients (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
LINUXNAME=	${PORTNAME}${PKGNAMESUFFIX}
RPMVERSION=	26.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	xorglibs pulseaudio-libs
USE_LINUX_RPM=	yes

.include <bsd.port.mk>
