PORTNAME=	harfbuzz
PORTVERSION=	1.7.5
DISTVERSIONSUFFIX=	-2.el7
CATEGORIES=	print linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenType text shaping engine (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://harfbuzz.github.io/

LICENSE=	mit

USES=		cpe linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	graphite2
USE_LINUX_RPM=	yes
CPE_VENDOR=	harfbuzz_project

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
