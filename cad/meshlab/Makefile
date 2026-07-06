PORTNAME=	meshlab
DISTVERSIONPREFIX=	Meshlab-
DISTVERSION=	2020.05
PORTREVISION=	2
CATEGORIES=	cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	3D triangular meshes processing and editing tool
WWW=		https://www.meshlab.net/

LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/include/vcglib/img/img.h:devel/vcglib
LIB_DEPENDS=	libmpirxx.so:math/mpir

USES=		dos2unix gl qmake:outsource qt:5
DOS2UNIX_GLOB=	*.c *.cpp *.h
USE_CXXSTD=	c++11
USE_GITHUB=	yes
GH_ACCOUNT=	cnr-isti-vclab
USE_GL=		gl glu glew
USE_LDCONFIG=	yes
USE_QT=		buildtools:build core gui network \
		opengl script xml xmlpatterns widgets

QMAKE_SOURCE_PATH=	${WRKSRC}/src/meshlab.pro

.if !exists(/usr/include/omp.h)
USES+=		compiler:gcc-c++11-lib
.else
USES+=		compiler:c++11-lang
.endif

post-patch:
	${REINPLACE_CMD} 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/src/general.pri

do-install:
	${MKDIR} ${PREFIX}/lib/meshlab/plugins
	cd ${BUILD_WRKSRC}/distrib/plugins && ${INSTALL_LIB} *.so ${PREFIX}/lib/meshlab/plugins
	${MKDIR} ${PREFIX}/lib/meshlab/shaders
	cd ${WRKSRC}/distrib/shaders && ${COPYTREE_SHARE} \* ${PREFIX}/lib/meshlab/shaders
	${INSTALL_LIB} ${BUILD_WRKSRC}/distrib/lib/* ${PREFIX}/lib
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/distrib/meshlab ${PREFIX}/lib/meshlab
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/distrib/meshlabserver ${PREFIX}/lib/meshlab
	${RLN} ${PREFIX}/lib/meshlab/meshlab ${PREFIX}/bin
	${RLN} ${PREFIX}/lib/meshlab/meshlabserver ${PREFIX}/bin

.include <bsd.port.mk>
