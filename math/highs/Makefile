PORTNAME=	highs
DISTVERSIONPREFIX=	v
DISTVERSION=	1.13.0
CATEGORIES=	math
PKGNAMEPREFIX=	coin-or-

MAINTAINER=	yuri@FreeBSD.org
COMMENT=	Solver for large scale sparse linear programming (LP) problems
WWW=		https://github.com/ERGO-Code/HiGHS

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cmake:testing compiler:c++11-lang pathfix pkgconfig
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	ERGO-Code
GH_PROJECT=	HiGHS

CMAKE_OFF=	BUILD_TESTING
PATHFIX_CMAKELISTSTXT=	CMakeLists.txt cpp-highs.cmake

post-install:
	# see https://github.com/ERGO-Code/HiGHS/issues/502
	${RM} -r ${PREFIX}/external
	# remove stray files
	@${RM} \
		${PREFIX}/LICENSE.txt \
		${PREFIX}/README.md \
		${PREFIX}/THIRD_PARTY_NOTICES.md

# tests as of 1.13.0: 100% tests passed, 0 tests failed out of 2

.include <bsd.port.mk>
