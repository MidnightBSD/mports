PORTNAME=	aws-c-sdkutils
DISTVERSIONPREFIX=	v
DISTVERSION=	0.2.4
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AWS SDK C utilities
WWW=		https://github.com/awslabs/aws-c-sdkutils

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libaws-c-common.so:devel/aws-c-common

USES=		cmake:testing

USE_GITHUB=	yes
GH_ACCOUNT=	awslabs

USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	BUILD_TESTING

.include <bsd.port.mk>
