PORTNAME=	cairo
PORTVERSION=	1.17.4
PORTREVISION=	1
DISTVERSIONSUFFIX=	-7.el9
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vector graphics library Cairo (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.cairographics.org/

LICENSE=	lgpl2.1

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	dri fontconfig pixman xorglibs
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CPE_VENDOR=	cairographics

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
