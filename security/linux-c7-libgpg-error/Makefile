# $MidnightBSD$

PORTNAME=	libgpg-error
PORTVERSION=	1.12
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common error values for all GnuPG components (Linux CentOS ${LINUX_DIST_VER})

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

LICENSE=	lgpl2.1

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	3.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
