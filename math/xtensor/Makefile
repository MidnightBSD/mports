PORTNAME=	xtensor
DISTVERSION=	0.24.2
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-dimensional arrays with broadcasting and lazy computing

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	nlohmann-json>0:devel/nlohmann-json \
		xtl-quant-stack>0:devel/xtl-quant-stack
RUN_DEPENDS=	nlohmann-json>0:devel/nlohmann-json \
		xtl-quant-stack>0:devel/xtl-quant-stack

USES=		cmake
USE_GITHUB=	yes
GH_ACCOUNT=	xtensor-stack

NO_BUILD=	yes
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
