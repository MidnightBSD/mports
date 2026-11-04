PORTNAME=	cairo
PORTVERSION=	1.15.12
DISTVERSIONSUFFIX=	-4.el7
PORTREVISION=	2
CATEGORIES=	graphics linux
PKGNAMESUFFIX=	-gobject

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vector graphics library Cairo (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1 MPL20
LICENSE_COMB=	dual

SKIP_FAKE_ALL=  yes

USES=		cpe linux:c7
USE_LINUX=	cairo dri fontconfig freetype imageformats-libs pixman xorglibs
USE_LINUX_RPM=	yes
CPE_VENDOR=	cairographics

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
