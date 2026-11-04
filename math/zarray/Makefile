PORTNAME=	zarray
DISTVERSION=	0.1.0
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamically typed N-D expression system based on xtensor

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

HPP_DEPENDS=	nlohmann-json>0:devel/nlohmann-json \
		xtensor>0:math/xtensor
BUILD_DEPENDS=	${HPP_DEPENDS}
RUN_DEPENDS=	${HPP_DEPENDS}
TEST_DEPENDS=	googletest>0:devel/googletest

USES=		cmake compiler:c++14-lang

USE_GITHUB=	yes
GH_ACCOUNT=	xtensor-stack

NO_BUILD=	yes
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
