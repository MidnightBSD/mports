PORTNAME=	opentimelineio
DISTVERSIONPREFIX=	v
DISTVERSION=	0.17.0
PORTREVISION=	1
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	API and interchange format for editorial timeline information
WWW=		https://github.com/PixarAnimationStudios/OpenTimelineIO

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

LIB_DEPENDS=	libImath-3_1.so:math/Imath

USES=		cmake:testing compiler:c++14-lang
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	PixarAnimationStudios
GH_PROJECT=	OpenTimelineIO

GH_TUPLE=	Tencent:rapidjson:06d58b9e848c650114556a23294d0b6440078c61:Tencent_rapidjson/src/deps/rapidjson

CMAKE_ON=	OTIO_FIND_IMATH
CMAKE_OFF=	OTIO_DEPENDENCIES_INSTALL

PORTSCOUT=	limit:^.*[0-9]$$ # should end with a digit to prevent tags like last_pure_python

.include <bsd.port.mk>
