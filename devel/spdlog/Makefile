PORTNAME=	spdlog
DISTVERSIONPREFIX=	v
DISTVERSION=	1.15.0
PORTREVISION=	0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Super fast C++ logging library
WWW=		https://github.com/gabime/spdlog

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libfmt.so:devel/libfmt

USES=		cmake compiler:c++11-lib pathfix

USE_GITHUB=	yes
GH_ACCOUNT=	gabime
USE_LDCONFIG=	yes
CMAKE_ON=	SPDLOG_BUILD_SHARED SPDLOG_FMT_EXTERNAL
CMAKE_OFF=	SPDLOG_BUILD_BENCH
PLIST_SUB=	SOVERSION="${DISTVERSION}"

post-extract:
	-${RM} -r ${WRKSRC}/include/spdlog/fmt/bundled

post-patch:
	-${RM} ${WRKSRC}/include/spdlog/fmt/*.h.orig

.include <bsd.port.mk>
