PORTNAME=	libnghttp2
PORTVERSION=	1.43.0
DISTVERSIONSUFFIX=	-6.el9
PORTREVISION=	3
CATEGORIES=	www devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP/2 C Library (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://nghttp2.org/ \
		https://github.com/nghttp2/nghttp2

LICENSE=	mit

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	icu
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}
SRC_DISTFILES=	nghttp2-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

.include <bsd.port.mk>
