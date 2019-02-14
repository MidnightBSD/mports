# $MidnightBSD$

PORTNAME=	pango
PORTVERSION=	1.28.1
CATEGORIES=	x11-toolkits linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pango library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
RPMVERSION=	11.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	cairo fontconfig libthai xorglibs
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
