PORTNAME=	aws-c-compression
DISTVERSIONPREFIX=	v
DISTVERSION=	0.3.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C99 implementation of compression algorithms
WWW=		https://github.com/awslabs/aws-c-compression

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libaws-c-common.so:devel/aws-c-common

USES=		cmake:testing

USE_GITHUB=	yes
GH_ACCOUNT=	awslabs

USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS
CNAKE_OFF=	BUILD_TESTING

.include <bsd.port.mk>
