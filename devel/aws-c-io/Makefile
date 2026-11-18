PORTNAME=	aws-c-io
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Event driven framework for implementing application protocols
WWW=		https://github.com/awslabs/aws-c-io

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libaws-c-cal.so:security/aws-c-cal \
		libaws-c-common.so:devel/aws-c-common \
		libs2n.so:security/s2n-tls
BUILD_RUN_DEPENDS=	s2n-tls>=1.7.13,1:security/s2n-tls

USES=		cmake:testing localbase ssl
USE_GITHUB=	yes
GH_ACCOUNT=	awslabs
USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	BUILD_TESTING

NO_TEST=	yes

PLIST_SUB=	SOVERSION=${DISTVERSION} \
		SOVERSION_R=${DISTVERSION:R}

.include <bsd.port.mk>
