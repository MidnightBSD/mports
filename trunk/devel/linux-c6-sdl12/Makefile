# $MidnightBSD$

PORTNAME=	sdl
PORTVERSION=	1.2.14
CATEGORIES=	devel linux
DISTNAME=	${LINUXNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform multi-media development API (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

DESCR=		${.CURDIR}/../${PORTNAME}12/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${LINUXNAME}-${PORTVERSION}
LINUXNAME=	SDL
RPMVERSION=	7.el6_7.1
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	xorglibs
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
