PORTNAME=	lazperf
DISTVERSION=	3.4.0
CATEGORIES=	archivers databases geography

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alternative LAZ implementation for C++ and JavaScript
WWW=		https://github.com/hobu/laz-perf

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake compiler:c++17-lang
USE_GITHUB=	yes
GH_ACCOUNT=	hobu
GH_PROJECT=	laz-perf
USE_LDCONFIG=	yes

CMAKE_OFF=	WITH_TESTS

.include <bsd.port.mk>
