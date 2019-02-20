# $MidnightBSD$

PORTNAME=	libtiff
PORTVERSION=	4.0.3
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library routines for working with TIFF images (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	bsd3

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../tiff/pkg-descr
RPMVERSION=	27.el7_3
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	jbigkit jpeg
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
