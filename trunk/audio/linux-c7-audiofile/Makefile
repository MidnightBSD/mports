# $MidnightBSD$

PORTNAME=	audiofile
PORTVERSION=	0.3.6
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the Audio File Library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../lib${PORTNAME}/pkg-descr
RPMVERSION=	4.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
