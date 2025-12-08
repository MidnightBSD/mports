PORTNAME=		cereal
DISTVERSIONPREFIX=	v
DISTVERSION=	1.3.2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++11 library for serialization
WWW=		https://github.com/USCiLab/cereal

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	boost-libs>0:devel/boost-libs
RUN_DEPENDS=	boost-libs>0:devel/boost-libs

USES=		cmake compiler:c++11-lang cpe
CPE_VENDOR=	usc

USE_GITHUB=	yes
GH_ACCOUNT=	USCiLab

CFLAGS+=	-Wno-unused-private-field

CMAKE_ON=	SKIP_PORTABILITY_TEST
CMAKE_OFF=	BUILD_TESTS BUILD_SANDBOX WITH_WERROR

NO_ARCH=	yes
NO_TEST=	yes

post-install:
	${FIND} ${STAGEDIR}${PREFIX} -name LICENSE -delete

.include <bsd.port.mk>
