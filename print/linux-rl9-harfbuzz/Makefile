PORTNAME=	harfbuzz
PORTVERSION=	2.7.4
DISTVERSIONSUFFIX=	-10.el9
PORTREVISION=	2
CATEGORIES=	print linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenType text shaping engine (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://harfbuzz.github.io/

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	graphite2
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CPE_VENDOR=	harfbuzz_project

DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
