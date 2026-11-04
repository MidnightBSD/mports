PORTNAME=	octomap
DISTVERSIONPREFIX=	v
DISTVERSION=	1.10.0
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Efficient probabilistic 3D mapping framework based on octrees
WWW=		https://octomap.github.io/

LICENSE=	bsd3 gpl2
LICENSE_COMB=	dual
LICENSE_FILE_bsd3=	${WRKSRC}/octomap/LICENSE.txt
LICENSE_FILE_gpl2=	${WRKSRC}/octovis/LICENSE.txt

LIB_DEPENDS=	libQGLViewer.so:graphics/libQGLViewer

USES=		cmake:testing compiler:c++11-lang localbase:ldflags gl qt:5
USE_QT=		core gui opengl xml widgets buildtools:build qmake:build
USE_GL=		gl glu
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	OctoMap

CMAKE_ON=	OCTOVIS_QT5
CMAKE_ARGS=	-DQGLVIEWER_BASE_DIR:PATH=${LOCALBASE}/include/QGLViewer

NO_TEST=	yes

.include <bsd.port.mk>
