PORTNAME=	libepoxy
PORTVERSION=	1.5.5
DISTVERSIONSUFFIX=	-4.el9
PORTREVISION=	1
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to handle OpenGL function pointer management (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://github.com/anholt/libepoxy

LICENSE=	mit

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
