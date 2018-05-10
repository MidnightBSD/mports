# $MidnightBSD$

PORTNAME=	assimp
PORTVERSION=	3.3.1
DISTVERSIONPREFIX=	v
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to import various 3D model formats in a uniform manner

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake compiler:c++11-lib pkgconfig
USE_GITHUB=		yes
USE_LDCONFIG=	yes

# CMAKE_ARGS instructs cmake to skip runtime path removal during install
CMAKE_ARGS+=	-DCMAKE_SKIP_RPATH:BOOL=ON -DASSIMP_BUILD_TESTS:BOOL=OFF

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == gcc
# GCC C++11 support is broken on FreeBSD (see PR 193528 for details)
CXXFLAGS+=	-D_GLIBCXX_USE_C99
.endif

post-patch: .SILENT
	${REINPLACE_CMD} -e '/zzip-zlib-config/d' \
		${WRKSRC}/cmake-modules/FindZLIB.cmake
	${REINPLACE_CMD} -e '/working branch$$/,/^)/d ; /minizip/d ; \
		s|$${ASSIMP_LIB_INSTALL_DIR}/pkgconfig|libdata/pkgconfig|' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.post.mk>
