PORTNAME=	aws-c-cal
DISTVERSIONPREFIX=	v
DISTVERSION=	0.9.0
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Aws Crypto Abstraction Layer
WWW=		https://github.com/awslabs/aws-c-cal

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libaws-c-common.so:devel/aws-c-common

USES=		cmake:testing ssl
USE_GITHUB=	yes
GH_ACCOUNT=	awslabs
USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	BUILD_TESTING

.include <bsd.port.mk>
