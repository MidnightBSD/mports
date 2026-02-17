PORTNAME=	glslang
DISTVERSION=	16.2.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL and OpenGL ES shader front end and validator
WWW=		https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/ \
		https://github.com/KhronosGroup/glslang

LICENSE=	Apache-2.0 bsd2 bsd3 gpl3 mit
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	spirv-tools>=2024.4.r2:graphics/spirv-tools
RUN_DEPENDS=	spirv-tools>0:graphics/spirv-tools
TEST_DEPENDS=	bash:shells/bash \
		gmake:devel/gmake

FLAVORS=	static shared
FLAVOR?=	${FLAVORS:[1]}
shared_PKGNAMESUFFIX=	-shared

USES=		cmake:testing compiler:c++11-lib python:build

NO_TEST=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	KhronosGroup

CMAKE_ON=	ALLOW_EXTERNAL_SPIRV_TOOLS

PORTSCOUT=	limit:^[0-9]+\.	# avoid tags like sdk-candidate-26-jul-2020

.if ${FLAVOR} == static
PLIST_SUB=	SHARED="@comment " \
		STATIC=""
.else
CMAKE_ON+=	BUILD_SHARED_LIBS
PLIST_SUB=	SHARED="" \
		STATIC="@comment " \
		SOVERSION_FULL=${DISTVERSION} \
		SOVERSION_MAJOR=${DISTVERSION:R:R}

post-install:
	${RM} -r ${FAKE_DESTDIR}${PREFIX}/bin/* \
		 ${FAKE_DESTDIR}${PREFIX}/include/* \
		 ${FAKE_DESTDIR}${PREFIX}/lib/cmake
.endif

.include <bsd.port.mk>
