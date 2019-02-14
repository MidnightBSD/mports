# $MidnightBSD$

PORTNAME=	nss
PORTVERSION=	3.28.4
CATEGORIES=	security linux
LIB_DISTNAMES=	${DISTNAME} \
		${PORTNAME}-pem-1.0.3-4.el7 \
		${PORTNAME}-util-${PORTVERSION}-3.el7 \
		${PORTNAME}-softokn-3.28.3-8.el7_4
SRC_DISTFILES=	${DISTNAME}${SRC_SUFX}:SOURCE \
		${PORTNAME}-pem-1.0.3-4.el7${SRC_SUFX}:SOURCE \
		${PORTNAME}-util-${PORTVERSION}-3.el7${SRC_SUFX}:SOURCE \
		${PORTNAME}-softokn-3.28.3-8.el7_4${SRC_SUFX}:SOURCE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network Security Services (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	mpl

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	15.el7_4
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	nspr sqlite3
USE_LINUX_RPM=	yes

.include <bsd.port.mk>
