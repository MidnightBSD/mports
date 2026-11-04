PORTNAME=	aws-c-common
DISTVERSIONPREFIX=	v
DISTVERSION=	0.12.3
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core c99 package for AWS SDK for C
WWW=		https://github.com/awslabs/aws-c-common

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake:testing
USE_GITHUB=	yes
GH_ACCOUNT=	awslabs

USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	BUILD_TESTING

NO_TEST=	yes

.include <bsd.port.mk>
