# $MidnightBSD$

PORTNAME=	msbuild
DISTVERSIONPREFIX=	v
DISTVERSION=	15.8-preview
CATEGORIES=	devel
MASTER_SITES=	https://github.com/mono/msbuild/releases/download/0.06/:boostrap
DISTFILES=	mono_msbuild_xplat-master-3c930fa8.zip:bootstrap \
		mono-msbuild-v15-8-preview-0.06_GH0.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build platform for .NET and Visual Studio

LICENSE=	mit

BUILD_DEPENDS=	bash:shells/bash

NUGET_FEEDS=	DOTNET_CORE NUGET ROSLYN ROSLYN_TOOLS SYMREADER_CONVERTER
NUGET_LAYOUT=	dotnet

USES=		mono:nuget shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	mono
GH_TAGNAME=	0.06
SHEBANG_FILES=	*.sh artifacts/mono-msbuild/msbuild build.sh build/*.sh

MAKE_ENV=	GIT_COMMIT=3c930fa8721935cf0e381fd349f6f50cf2bc223d
MAKE_JOBS_UNSAFE=MSBuild has not implemented concurrent builds on non Windows platforms
ALL_TARGET=	all-mono
TEST_TARGET=	test-mono

post-extract:
	${MKDIR} ${WRKSRC}/artifacts/
	${MV} ${WRKDIR}/msbuild ${WRKSRC}/artifacts/mono-msbuild/

do-build:
	(cd ${WRKSRC}; \
		${SETENV} ${MAKE_ENV} ./build/build.sh -host mono -configuration Release -skipTests build)

do-install:
	(cd ${WRKSRC}; \
		${SETENV} ${MAKE_ENV} DESTDIR=${FAKE_DESTDIR} PATH=${WRKSRC}/artifacts/mono-msbuild:$$PATH ./install-mono-prefix.sh ${TRUE_PREFIX})

do-test:
	(cd ${WRKSRC}; \
		${SETENV} ${MAKE_ENV} ./build/build.sh -host mono -configuration Release build)

.include <bsd.port.mk>
