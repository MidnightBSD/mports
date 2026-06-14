PORTNAME=	antimony
DISTVERSION=	0.9.3-20230118
CATEGORIES=	cad
PKGNAMESUFFIX=	-cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CAD from a parallel universe
WWW=		https://www.mattkeeter.com/projects/antimony/3/ \
		https://github.com/mkeeter/antimony

LICENSE=	mit

BUILD_DEPENDS=	lemon:devel/lemon
LIB_DEPENDS=	${PY_BOOST} \
		libpng16.so:graphics/png

USES=		cmake python qt:5
USE_QT=		concurrent core gui network opengl widgets buildtools:build qmake:build

USE_GITHUB=	yes
GH_ACCOUNT=	mkeeter
GH_TAGNAME=	f6a56dd

CMAKE_ARGS=	-DPython_EXECUTABLE=${PYTHON_CMD}

post-patch:
	@${MV} ${WRKSRC}/py/nodes/2D\ →\ 3D ${WRKSRC}/py/nodes/2D\ to\ 3D
	@${MV} ${WRKSRC}/py/nodes/3D\ →\ 2D ${WRKSRC}/py/nodes/3D\ to\ 2D
	@${REINPLACE_CMD} -e 's|2D → 3D|2D to 3D|g' \
		-e 's|3D → 2D|3D to 2D|g' \
		${WRKSRC}/app/graph/constructor/populate.cpp

.include <bsd.port.mk>
