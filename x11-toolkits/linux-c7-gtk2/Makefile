PORTNAME=	gtk2
PORTVERSION=	2.24.31
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	x11-toolkits linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK library, version 2.X (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.gtk.org/

LICENSE=	lgpl

USES=		cpe linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	atk gdkpixbuf pango xorglibs
USE_LINUX_RPM=	yes
CPE_VENDOR=   gnome
CPE_PRODUCT=  gtk

LIB_DISTNAMES=	${DISTNAME} \
		${PORTNAME}-immodules-${DISTVERSIONFULL}

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}0/pkg-descr

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
