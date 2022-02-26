PORTNAME=	xtl
DISTVERSION=	0.7.4
CATEGORIES=	devel
PKGNAMESUFFIX=	-quant-stack

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Template library that supports other quantstack projects

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	nlohmann-json>0:devel/nlohmann-json
RUN_DEPENDS=	nlohmann-json>0:devel/nlohmann-json
TEST_DEPENDS=	nlohmann-json>0:devel/nlohmann-json \
		googletest>0:devel/googletest

USES=		cmake
USE_GITHUB=	yes
GH_ACCOUNT=	xtensor-stack

NO_BUILD=	yes
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
