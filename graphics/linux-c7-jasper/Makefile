# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	jasper
PORTVERSION=	1.900.1
DISTVERSIONSUFFIX=	-33.el7
PORTREVISION=	5
CATEGORIES=	graphics linux
PKGNAMESUFFIX=	-libs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JPEG-2000 reference implementation (Linux CentOS ${LINUX_DIST_VER})

LICENSE=        JASPER
LICENSE_NAME=   JasPer License Version 2.0
LICENSE_TEXT=	jasper license
LICENSE_PERMS=  dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	jpeg
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
