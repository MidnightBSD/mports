PORTNAME=	gdk-pixbuf2
PORTVERSION=	2.36.12
DISTVERSIONSUFFIX=	-3.el7
PORTREVISION=	1
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphic library for GTK (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://developer.gnome.org/gdk-pixbuf/

LICENSE=	lgpl

USES=		cpe linux:c7
CPE_VENDOR=	gnome
CPE_PRODUCT=	gdk-pixbuf
USE_LDCONFIG=	yes
USE_LINUX=	imageformats-libs xorglibs
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
