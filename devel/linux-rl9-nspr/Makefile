PORTNAME=	nspr
PORTVERSION=	4.35.0
DISTVERSIONSUFFIX=	-14.el9_4
PORTREVISION=	3
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Netscape Portable Runtime (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://developer.mozilla.org/docs/Mozilla/Projects/NSPR

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

SRC_DISTFILES=	nss-3.101.0-7.el9_4${SRC_SUFX}:SOURCE

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

.include <bsd.port.mk>
