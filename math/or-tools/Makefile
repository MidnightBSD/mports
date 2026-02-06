PORTNAME=	or-tools
DISTVERSIONPREFIX=	v
DISTVERSION=	9.14
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google's Operations Research tools
WWW=		https://github.com/google/or-tools

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

PATCH_DEPENDS=	gsed:textproc/gsed
xBUILD_DEPENDS=	benchmark>0:devel/benchmark \
		googletest>0:devel/googletest
LIB_DEPENDS=	libabsl_base.so:devel/abseil \
		libbzip2.so:misc/vxl \
		libCbc.so:math/cbc \
		libCgl.so:math/cgl \
		libcoinasl.so:math/asl \
		libcoinmumps.so:math/coin-or-mumps \
		libCoinUtils.so:math/coinutils \
		libgflags.so:devel/gflags \
		libglog.so:devel/glog \
		libhighs.so:math/highs \
		libnauty.so:math/nauty \
		libopenblas.so:math/openblas \
		libOsi.so:math/osi \
		libOsiClp.so:math/clp \
		libprotobuf.so:devel/protobuf \
		libre2.so:devel/re2
TEST_DEPENDS=	googletest>0:devel/googletest

USES=		blaslapack cmake:testing compiler:c++17-lang eigen:3 pkgconfig
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	google

NO_TEST=	yes

CMAKE_OFF=	BUILD_PYTHON BUILD_DEPS INSTALL_BUILD_DEPS \
		BUILD_TESTING BUILD_EXAMPLES BUILD_SAMPLES
CMAKE_ON=	BUILD_CXX \
		USE_PDLP
CMAKE_TESTING_ON=	BUILD_TESTING BUILD_EXAMPLES BUILD_CXX_EXAMPLES

CONFIGURE_ENV=	UNIX_CBC_DIR=${LOCALBASE} UNIX_CLP_DIR=${LOCALBASE}

OPTIONS_DEFINE=		DOCS FLATZINC SCIP
OPTIONS_DEFAULT=	FLATZINC # SCIP
OPTIONS_SUB=		yes

FLATZINC_DESC=		Build FlatZinc - MiniZinc interface
FLATZINC_CMAKE_BOOL=	BUILD_FLATZINC

SCIP_DESC=		Use the SCIP solver # SCIP package isn't built because of licensing restrictions
SCIP_CMAKE_BOOL=	USE_SCIP
SCIP_LIB_DEPENDS=	libscip.so:math/SCIP
SCIP_BROKN=		configure fails, see https://github.com/google/or-tools/issues/4912

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME:S/-//}
PORTDOCS=	*

post-patch:
	@${REINPLACE_CMD} -e '17,19d' ${WRKSRC}/ortools/base/logging.h

post-install:
	@${FIND} ${STAGEDIR}${PREFIX} -type d -empty -delete

.include <bsd.port.mk>
