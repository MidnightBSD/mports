PORTNAME=	sdl_mixer
PORTVERSION=	1.2.12
DISTVERSIONSUFFIX=	-4.el7
PORTREVISION=	1
CATEGORIES=	audio linux
MASTER_SITES=	EPEL7/s
DISTNAME=	SDL_mixer-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sample multi-channel audio mixer library (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.libsdl.org/projects/SDL_mixer/index.html

LICENSE=	gpl2

ONLY_FOR_ARCHS=	aarch64 amd64

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	sdl12
USE_LINUX_RPM=	nolib

CONFLICTS=	linux-c6-${PORTNAME}
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/SDL_mixer-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
