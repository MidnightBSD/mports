# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>

PORTNAME=	abseil
PORTVERSION=	20220623.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abseil Common Libraries (C++)
WWW=		https://abseil.io/

LICENSE=	apache2

USES=		cmake compiler:c++11-lang
USE_GITHUB=	yes
GH_PROJECT=	${PORTNAME}-cpp

CMAKE_ARGS=	-DBUILD_SHARED_LIBS:BOOL=ON \
		-DCMAKE_CXX_STANDARD=17 # force the same highest C++ standard because of ABI differences: see https://github.com/abseil/abseil-cpp/issues/819

_GET_SOVER=	${GREP} SOVERSION ${WRKSRC}/CMake/AbseilHelpers.cmake \
		| ${CUT} -d\" -f2
PLIST_SUB+=	LIBSUFX=${_GET_SOVER:sh}

.include <bsd.port.mk>
