PORTNAME=	shaderc
PORTVERSION=	2024.0
DISTVERSIONSUFFIX=	-1.el9
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLSL/HLSL to SPIR-V shader compiler (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://github.com/google/shaderc

LICENSE=	Apache-2.0

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

LIB_DISTNAMES=	lib${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/lib${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
