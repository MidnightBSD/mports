PORTNAME=	sdl_image
PORTVERSION=	1.2.12
DISTVERSIONSUFFIX=	-11.el7
PORTREVISION=	2
CATEGORIES=	graphics linux
MASTER_SITES=	EPEL7/s
DISTNAME=	SDL_image-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple library to load images as SDL interfaces (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.libsdl.org/projects/SDL_image/

LICENSE=	gpl2

ONLY_FOR_ARCHS=	aarch64 amd64

USES=		cpe linux:c7
CPE_VENDOR=	libsdl
USE_LDCONFIG=	yes
USE_LINUX=	jpeg png sdl12 tiff
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/SDL_image-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
