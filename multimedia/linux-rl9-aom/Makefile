PORTNAME=	aom
PORTVERSION=	3.12.0
DISTVERSIONSUFFIX=	-1.el9
MASTER_SITES=	EPEL9
PKGNAMESUFFIX=	-libs
CATEGORIES=	multimedia linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AV1 reference encoder/decoder (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://aomedia.org/

LICENSE=	bsd2

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	brotli highway libjxl
USE_LINUX_RPM=	yes

#BIN_DISTNAMES=	${PORTNAME}-${DISTVERSIONFULL}
LIB_DISTNAMES=	lib${PORTNAME}-${DISTVERSIONFULL}
SRC_DISTFILES=	${PORTNAME}-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${ARCH} == amd64
USE_LINUX+=	vmaf
.endif

.include <bsd.port.mk>
