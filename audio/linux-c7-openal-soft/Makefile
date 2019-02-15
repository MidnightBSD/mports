# $MidnightBSD$

PORTNAME=	openal-soft
PORTVERSION=	1.16.0
CATEGORIES=	audio linux
MASTER_SITES=	EPEL7/o

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	3D positional spatialized sound library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	other

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
ONLY_FOR_ARCHS=	amd64
RPMVERSION=	3.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	alsalib
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
