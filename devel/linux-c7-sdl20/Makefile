PORTNAME=	sdl20
PORTVERSION=	2.0.14
DISTVERSIONSUFFIX=	-2.el7
CATEGORIES=	devel linux
MASTER_SITES=	EPEL7/s
DISTNAME=	SDL2-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform multi-media development API (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	zlib

ONLY_FOR_ARCHS=	amd64

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	xorglibs
USE_LINUX_RPM=	nolib

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/SDL2-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
