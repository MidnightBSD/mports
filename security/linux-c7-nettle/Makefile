PORTNAME=	nettle
PORTVERSION=	2.7.1
DISTVERSIONSUFFIX=	-9.el7_9
PORTREVISION=	1
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level cryptographic library (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.lysator.liu.se/~nisse/nettle/

LICENSE=	MPL20

SKIP_FAKE_ALL=  yes

USES=		cpe linux:c7
CPE_VENDOR=	${PORTNAME}_project
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
