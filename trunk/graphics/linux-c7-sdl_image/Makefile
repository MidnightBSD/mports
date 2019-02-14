# $MidnightBSD$

PORTNAME=	sdl_image
PORTVERSION=	1.2.12
CATEGORIES=	graphics linux
MASTER_SITES=	EPEL7/s
DISTNAME=	${LINUXNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple library to load images as SDL interfaces (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${LINUXNAME}-${PORTVERSION}
LINUXNAME=	SDL_image
ONLY_FOR_ARCHS=	amd64
RPMVERSION=	11.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	jpeg png sdl12 tiff
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
