PORTNAME=	libasyncns
PORTVERSION=	0.8
DISTVERSIONSUFFIX=	-22.el9
PORTREVISION=	1
CATEGORIES=	dns devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for executing DNS queries (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://0pointer.de/lennart/projects/libasyncns/

LICENSE=	lgpl2.1+

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
