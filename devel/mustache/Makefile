PORTNAME=	mustache
DISTVERSIONPREFIX=	v
DISTVERSION=	4.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mustache text templates for modern C++
WWW=		https://github.com/kainjow/Mustache

LICENSE=	BSL-1.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake
USE_GITHUB=	yes
GH_ACCOUNT=	kainjow
GH_PROJECT=	Mustache

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	include/kainjow/catch.hpp \
		include/kainjow/mustache.hpp

do-install: # https://github.com/kainjow/Mustache/issues/39
	${MKDIR} ${STAGEDIR}${PREFIX}/include/${GH_ACCOUNT}
	${INSTALL_DATA} ${WRKSRC}/*.hpp ${STAGEDIR}${PREFIX}/include/${GH_ACCOUNT}

.include <bsd.port.mk>
