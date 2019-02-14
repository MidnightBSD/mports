# $MidnightBSD$

PORTNAME=	nss
PORTVERSION=	3.36.0
CATEGORIES=	security linux
LIB_DISTNAMES=	${DISTNAME} \
		${PORTNAME}-util-${PORTVERSION}-1.el6 \
		${PORTNAME}-softokn-3.14.3-23.3.el6_8
SRC_DISTFILES=	${DISTNAME}${SRC_SUFX}:SOURCE \
		${PORTNAME}-util-${PORTVERSION}-1.el6${SRC_SUFX}:SOURCE \
		${PORTNAME}-softokn-3.14.3-23.3.el6_8${SRC_SUFX}:SOURCE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network Security Services (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	mpl

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	8.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	nspr sqlite3
USE_LINUX_RPM=	yes

.include <bsd.port.mk>
