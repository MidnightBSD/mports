PORTNAME=	lz4
PORTVERSION=	1.8.3
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	archivers linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LZ4 compression library and utilities (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://lz4.github.io/lz4/

LICENSE=        bsd2 gpl2
LICENSE_COMB=   multi

USES=		cpe linux:c7
USE_LDCONFIG=	yes
CPE_VENDOR=	lz4_project
USE_LINUX_RPM=	yes

DESCR=		${.CURDIR}/../liblz4/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
