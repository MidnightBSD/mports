# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	sdl
PORTVERSION=	1.2.15
DISTVERSIONSUFFIX=	-17.el7
PORTREVISION=	3
CATEGORIES=	devel linux
DISTNAME=	SDL-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform multi-media development API (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	xorglibs
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}12/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/SDL-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
