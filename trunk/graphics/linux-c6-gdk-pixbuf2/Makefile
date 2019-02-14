# $MidnightBSD$

PORTNAME=	gdk-pixbuf2
PORTVERSION=	2.24.1
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphic library for GTK+ (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	6.el6_7
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	jasper jpeg png tiff xorglibs
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
