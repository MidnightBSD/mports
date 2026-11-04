PORTNAME=	highway
PORTVERSION=	1.3.0
DISTVERSIONSUFFIX=	-1.el9
CATEGORIES=	devel linux
MASTER_SITES=	EPEL9

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance-portable, length-agnostic SIMD with runtime dispatch (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://github.com/google/highway

LICENSE=	Apache-2.0

SKIP_FAKE_ALL=	yes

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

PLIST_SUB=	LIBVERSION=${PORTVERSION}

.include <bsd.port.mk>
