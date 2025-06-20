PORTNAME=	cairo
PORTVERSION=	1.15.12
DISTVERSIONSUFFIX=	-4.el7
PORTREVISION=	1
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vector graphics library Cairo (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.cairographics.org/

LICENSE=	lgpl2.1 MPL11
LICENSE_COMB=	dual

USES=		cpe linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	dri fontconfig imageformats-libs pixman xorglibs
USE_LINUX_RPM=	yes
CPE_VENDOR=	cairographics

CONFLICTS=	linux-c6-${PORTNAME}
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
