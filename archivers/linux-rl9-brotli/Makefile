PORTNAME=	brotli
PORTVERSION=	1.0.9
DISTVERSIONSUFFIX=	-7.el9_5
PORTREVISION=	1
CATEGORIES=	archivers linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic-purpose lossless compression algorithm (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://github.com/google/brotli

LICENSE=	mit

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

LIB_DISTNAMES=	libbrotli-${PORTVERSION}${DISTVERSIONSUFFIX}

DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

.include <bsd.port.mk>
