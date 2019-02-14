# $MidnightBSD$

PORTNAME=	gnutls
PORTVERSION=	2.12.23
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Transport Layer Security library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	22.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	libtasn1 libgcrypt libgpg-error
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
