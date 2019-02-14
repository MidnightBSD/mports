# $MidnightBSD$

PORTNAME=	cairo
PORTVERSION=	1.14.8
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vector graphics library Cairo (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	dual

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	2.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	dri fontconfig pixman png xorglibs
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
