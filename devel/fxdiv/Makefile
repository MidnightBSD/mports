PORTNAME=	fxdiv
PORTVERSION=	g20181121
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C/C++ header-only library for division via FP inverse multiplication
WWW=		https://github.com/Maratyszcza/FXdiv

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake
USE_GITHUB=	yes
GH_ACCOUNT=	Maratyszcza
GH_PROJECT=	FXdiv
GH_TAGNAME=	f8c5354
USE_LDCONFIG=	yes

CMAKE_OFF=	FXDIV_BUILD_TESTS FXDIV_BUILD_BENCHMARKS

NO_BUILD=	yes
NO_ARCH=	yes
NO_TEST=	yes

PLIST_FILES=	include/fxdiv.h

.include <bsd.port.mk>
