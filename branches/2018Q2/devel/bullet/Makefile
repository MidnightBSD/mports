# $MidnightBSD$

PORTNAME=	bullet
PORTVERSION=	2.82
CATEGORIES=	devel
MASTER_SITES=	GOOGLE_CODE
DISTNAME=	${PORTNAME}-${PORTVERSION}-${SVN_COMMIT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	3D collision detection and rigid body dynamics library

LICENSE=	zlib

USE_GL=		gl glu glut
USE_XORG=	x11

USES=		cmake tar:tgz
CMAKE_ARGS=	-DBUILD_SHARED_LIBS:BOOL=ON

CPPFLAGS+=	-I${LOCALBASE}/include

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}-${SVN_COMMIT}

PORTDOCS=	*

SVN_COMMIT=	r2704

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e "s|{OPENGL_glu_LIBRARY}|{OPENGL_glu_LIBRARY} -lcompat|g" ${WRKSRC}/Demos/AllBulletDemos/CMakeLists.txt

post-install:
	@${MKDIR} ${STAGEDIR}/${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.pdf ${STAGEDIR}/${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/BulletLicense.txt ${STAGEDIR}/${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/ChangeLog ${STAGEDIR}/${DOCSDIR}/CHANGELOG

.include <bsd.port.mk>
