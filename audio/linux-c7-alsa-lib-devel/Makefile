PORTNAME=	alsa-lib
PORTVERSION=	1.1.8
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	audio linux
PKGNAMESUFFIX=	-devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advanced Linux Sound Architecture headers (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.alsa-project.org/

LICENSE=	lgpl2.1+

USES=		linux:c7
USE_LINUX=	alsalib
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
