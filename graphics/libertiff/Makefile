PORTNAME=	libertiff
PORTVERSION=	0.0.0.20250612
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++11 simple, header-only, TIFF reader
WWW=		https://github.com/libertiff/libertiff

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	googletest>=1.12.1:devel/googletest

USES=		cmake:testing compiler:c++11-lang

CMAKE_ON=	USE_EXTERNAL_GTEST
NO_ARCH=	yes

PLIST_FILES=	include/libertiff.hpp

USE_GITHUB=	yes
GH_TAGNAME=	fd42406

.include <bsd.port.mk>
