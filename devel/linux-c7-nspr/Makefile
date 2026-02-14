PORTNAME=	nspr
PORTVERSION=	4.35.0
DISTVERSIONSUFFIX=	-1.el7_9
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Netscape Portable Runtime (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://developer.mozilla.org/docs/Mozilla/Projects/NSPR

LICENSE=	lgpl gpl2 MPL20
LICENSE_COMB=	dual

SKIP_FAKE_ALL=  yes

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
