PORTNAME=	libdivide
DISTVERSIONPREFIX=v
DISTVERSION=	5.4.0
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast integer division using runtime divisors
WWW=		https://libdivide.com/

LICENSE=	zlib BSL
LICENSE_COMB=	dual
LICENSE_NAME_BSL=	Boost Software License 1.0
LICENSE_FILE_zlib=	${WRKSRC}/LICENSE.txt
LICENSE_FILE_BSL=	${WRKSRC}/LICENSE.txt
LICENSE_PERMS_BSL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		cmake:testing compiler:c++11-lang
USE_GITHUB=	yes
GH_ACCOUNT=	ridiculousfish
NO_ARCH=	yes

OPTIONS_DEFINE=		NATIVE

NATIVE_CMAKE_BOOL=	FREEBSD_NATIVE

.include <bsd.port.pre.mk>

# NEON support requires arm64. Keep CMAKE_OFF undefined on other architectures.
.if ${ARCH} == armv6 || ${ARCH} == armv7
CMAKE_OFF=	LIBDIVIDE_NEON
.endif

.include <bsd.port.post.mk>
