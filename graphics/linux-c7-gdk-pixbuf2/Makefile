# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	gdk-pixbuf2
PORTVERSION=	2.36.12
DISTVERSIONSUFFIX=	-3.el7
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphic library for GTK+ (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	jasper jpeg png tiff xorglibs
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
