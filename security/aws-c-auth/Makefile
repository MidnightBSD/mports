PORTNAME=	aws-c-auth
DISTVERSIONPREFIX=	v
DISTVERSION=	0.9.0
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C99 library implementation of AWS client-side authentication
WWW=		https://github.com/awslabs/aws-c-auth

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libaws-c-cal.so:security/aws-c-cal \
		libaws-c-common.so:devel/aws-c-common \
		libaws-c-compression.so:devel/aws-c-compression \
		libaws-c-http.so:devel/aws-c-http \
		libaws-c-io.so:devel/aws-c-io \
		libaws-c-sdkutils.so:devel/aws-c-sdkutils \
		libs2n.so:security/s2n-tls

USES=		cmake:testing ssl

USE_GITHUB=	yes
GH_ACCOUNT=	awslabs
USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	BUILD_TESTING

NO_TEST=	yes

.include <bsd.port.mk>
