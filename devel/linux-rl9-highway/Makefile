PORTNAME=	highway
PORTVERSION=	1.2.0
DISTVERSIONSUFFIX=	-2.el9
MASTER_SITES=	EPEL9
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance-portable, length-agnostic SIMD with runtime dispatch (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://github.com/google/highway

LICENSE=	Apache-2.0

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
