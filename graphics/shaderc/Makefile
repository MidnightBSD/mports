PORTNAME=	shaderc
DISTVERSIONPREFIX=	v
DISTVERSION=	2023.7
CATEGORIES=	graphics devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLSL/HLSL to SPIR-V shader compiler
WWW=		https://github.com/google/shaderc

LICENSE=	Apache-2.0

BUILD_DEPENDS=	glslang>0:graphics/glslang \
		spirv-tools>0:graphics/spirv-tools
TEST_DEPENDS=	googletest>0:devel/googletest

USES=		cmake:testing compiler:c++11-lib localbase:ldflags python:build
USE_GITHUB=	yes
USE_LDCONFIG=	yes
GH_ACCOUNT=	google
GH_TUPLE=	KhronosGroup:SPIRV-Headers:1.5.4.raytracing.fixed-324-g4183b26:headers/third_party/spirv-headers
CMAKE_ON+=	${CMAKE_TESTING_OFF}
CMAKE_TESTING_OFF=	SHADERC_SKIP_TESTS
CMAKE_ARGS=	-Dglslang_SOURCE_DIR:PATH="${LOCALBASE}/include/glslang" \
		-DSPIRV-Headers_SOURCE_DIR:PATH="${WRKSRC}/third_party/spirv-headers"
LDFLAGS+=	-Wl,-z,defs # glslang

NO_TEST=	yes

post-patch:
# Disable bundled dependencies
	${REINPLACE_CMD} '/third_party/d' ${WRKSRC}/CMakeLists.txt
# Unbreak tests with system spirv-tools
	${REINPLACE_CMD} 's,\$$<TARGET_FILE:\(spirv-dis\)>,\1,' \
		${WRKSRC}/glslc/test/CMakeLists.txt

pre-configure:
# Extract (snapshot) version from the port instead of CHANGES + .git/
	${REINPLACE_CMD} '/build-version/d' ${WRKSRC}/glslc/CMakeLists.txt
	${ECHO_CMD} "\"${PORTNAME} ${DISTVERSIONFULL}\n\"" >> ${WRKSRC}/glslc/src/build-version.inc
	${ECHO_CMD} "\"`${PKG_BIN} query '%n v%v' spirv-tools`\n\"" >> ${WRKSRC}/glslc/src/build-version.inc
	${ECHO_CMD} "\"`${PKG_BIN} query '%n %v' glslang`\n\"" >> ${WRKSRC}/glslc/src/build-version.inc

.include <bsd.port.mk>
