PORTNAME=	nspr
PORTVERSION=	4.36.0
DISTVERSIONSUFFIX=	-4.el9_4
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Netscape Portable Runtime (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://developer.mozilla.org/docs/Mozilla/Projects/NSPR

LICENSE=	MPL20

SKIP_FAKE_ALL=  yes

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

SRC_DISTFILES=	nss-3.112.0-4.el9_4${SRC_SUFX}:SOURCE

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

.include <bsd.port.mk>
