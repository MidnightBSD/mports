PORTNAME=	libdispatch
DISTVERSION=	6.1.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Grand Central Dispatch API support library

LICENSE=	Apache-2.0

USES=		cmake:testing compiler:c++17-lang
USE_LDCONFIG=	yes
USE_CXXSTD=	c++17

TESTING_UNSAFE=	upstream dispatch tests fail and timeout on MidnightBSD

USE_GITHUB=	yes
GH_ACCOUNT=	swiftlang
GH_PROJECT=	swift-corelibs-libdispatch
GH_TAGNAME=	swift-${DISTVERSION}-RELEASE

.include <bsd.mport.options.mk>

.if (${ARCH} == armv7 || ${ARCH} == i386)
CFLAGS+=	-Wno-incompatible-function-pointer-types
.endif

.include <bsd.port.mk>
