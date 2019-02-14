# $MidnightBSD$

PORTNAME=	sdl_mixer
PORTVERSION=	1.2.12
CATEGORIES=	audio linux
MASTER_SITES=	EPEL7/s
DISTNAME=	${LINUXNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sample multi-channel audio mixer library (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${LINUXNAME}-${PORTVERSION}
LINUXNAME=	SDL_mixer
ONLY_FOR_ARCHS=	amd64
RPMVERSION=	4.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	sdl12
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
