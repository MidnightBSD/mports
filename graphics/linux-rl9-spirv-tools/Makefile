PORTNAME=	spirv-tools
PORTVERSION=	2024.2
DISTVERSIONSUFFIX=	-1.el9
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for processing SPIR-V intermediate shader language modules (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://github.com/KhronosGroup/SPIRV-Tools

LICENSE=	Apache-2.0

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

BIN_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}
LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-libs-${DISTVERSIONFULL}

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
