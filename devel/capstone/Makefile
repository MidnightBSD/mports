PORTNAME=	capstone
DISTVERSION=	5.0.6
CATEGORIES=	devel
MASTER_SITES=	https://github.com/${PORTNAME}-engine/${PORTNAME}/releases/download/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-platform, multi-architecture disassembly framework
WWW=		http://capstone-engine.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.TXT

FAKE_OPTS=	trueprefix

USES=		cpe gmake tar:xz
CPE_VENDOR=	${PORTNAME}-engine
#USE_GITHUB=	yes
#GH_ACCOUNT=	capstone-engine
USE_LDCONFIG=	yes

MAKE_ENV+=	INSTALL_DATA="${INSTALL_DATA}" \
		INSTALL_LIB="${INSTALL_LIB}"
TEST_ENV=	${MAKE_ENV} \
		LD_LIBRARY_PATH=${STAGEDIR}${PREFIX}/lib
TEST_TARGET=	check

CONFLICTS=		capstone
CONFLICTS_BUILD=	capstone[34]

pre-test:
# Disable broken tests.
	@${REINPLACE_CMD} -E 's|^(check:.*)fuzzallcorp|\1|' ${WRKSRC}/Makefile

.include <bsd.port.mk>
