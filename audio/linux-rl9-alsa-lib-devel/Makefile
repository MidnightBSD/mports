PORTNAME=	alsa-lib
PORTVERSION=	1.2.12
DISTVERSIONSUFFIX=	-1.el9
CATEGORIES=	audio linux
PKGNAMESUFFIX=	-devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advanced Linux Sound Architecture headers (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.alsa-project.org/

LICENSE=	lgpl2.1+

USES=		linux:rl9
USE_LINUX=	alsalib
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

#OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
