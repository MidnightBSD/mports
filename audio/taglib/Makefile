PORTNAME=	taglib
DISTVERSION=	2.0.2
CATEGORIES=	audio
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/v${DISTVERSION}/ \
		https://taglib.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating ID3 tags and Ogg comments
WWW=		https://taglib.org/

LICENSE=		lgpl2.1 MPL11
LICENSE_COMB=		dual
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.LGPL
LICENSE_FILE_MPL11=	${WRKSRC}/COPYING.MPL

BUILD_DEPENDS=	utf8cpp>0:devel/utf8cpp
TEST_DEPENDS=	cppunit-config:devel/cppunit

USES=		cmake:testing compiler:c++17-lang cpe pathfix
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DCMAKE_CXX_VISIBILITY_PRESET=hidden
CMAKE_ON=	VISIBILITY_HIDDEN

CMAKE_TESTING_TARGET=	check

OPTIONS_DEFINE=	STATIC
OPTIONS_SUB=	yes

STATIC_CMAKE_BOOL_OFF=	BUILD_SHARED_LIBS

.include <bsd.port.mk>
