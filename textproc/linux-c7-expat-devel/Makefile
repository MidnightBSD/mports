PORTNAME=	expat
PORTVERSION=	2.1.0
DISTVERSIONSUFFIX=	-15.el7_9
PORTREVISION=	1
CATEGORIES=	textproc linux
PKGNAMESUFFIX=	-devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML 1.0 parser headers (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://github.com/libexpat/libexpat

LICENSE=	mit

USES=		cpe linux:c7
USE_LINUX=	expat
CPE_VENDOR=	${CPE_PRODUCT}_project
CPE_PRODUCT=	lib${PORTNAME}
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}
DESCR=		${.CURDIR}/../${PORTNAME}2/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
