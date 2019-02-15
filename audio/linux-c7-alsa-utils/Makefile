# $MidnightBSD$

PORTNAME=	alsa-utils
PORTVERSION=	1.1.3
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advanced Linux Sound Architecture utilities (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl3

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	2.el7
USES=		linux:c7
USE_LINUX=	alsalib alsa-plugins-oss
USE_LINUX_RPM=	nolib

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
