PORTNAME=	xcb-util-image
PORTVERSION=	0.4.0
DISTVERSIONSUFFIX=	-2.el7
PORTREVISION=	1
CATEGORIES=	x11 linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Port of Xlib's XImage and XShmImage functions (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://xcb.freedesktop.org/

LICENSE=	mit

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	xcb-util xorglibs
USE_LINUX_RPM=	yes

DESCR=		${.CURDIR:H}/${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
