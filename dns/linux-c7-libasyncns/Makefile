PORTNAME=	libasyncns
PORTVERSION=	0.8
DISTVERSIONSUFFIX=	-7.el7
PORTREVISION=	1
CATEGORIES=	dns devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for executing DNS queries (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://0pointer.de/lennart/projects/libasyncns/

LICENSE=	lgpl2.1+

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
