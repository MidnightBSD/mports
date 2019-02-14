# $MidnightBSD$

PORTNAME=	libgcrypt
PORTVERSION=	1.4.5
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose crypto library based on code used in GnuPG (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	12.el6_8
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	libgpg-error
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
