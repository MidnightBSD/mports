PORTNAME=	freetype
PORTVERSION=	2.10.4
DISTVERSIONSUFFIX=	-10.el9_5
PORTREVISION=	3
CATEGORIES=	print linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Font rendering engine (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.freetype.org/

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	imageformats-libs
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}2/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
