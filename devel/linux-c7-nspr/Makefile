PORTNAME=	nspr
PORTVERSION=	4.25.0
DISTVERSIONSUFFIX=	-2.el7_9
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Netscape Portable Runtime (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl gpl2 MPL20
LICENSE_COMB=	dual

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
