PORTNAME=	irrlicht
PORTVERSION=	1.8.4
CATEGORIES=	x11-toolkits graphics
MASTER_SITES=	SF/${PORTNAME}/Irrlicht%20SDK/${PORTVERSION:R}/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance realtime 3D engine

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/readme.txt

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	libpng.so:graphics/png

DOS2UNIX_GLOB=	Makefile *.cpp *.h *.txt
USES=		alias dos2unix gl gmake jpeg zip xorg
USE_GL=		gl
USE_XORG=	x11 xxf86vm
USE_LDCONFIG=	yes

ALL_TARGET=	sharedlib
PLIST_SUB=	PORTVERSION=${PORTVERSION} SOVERSION=${PORTVERSION:R}
SUB_FILES=	pkg-message
BUILD_WRKSRC=	${WRKSRC}/source/Irrlicht
INSTALL_WRKSRC=	${BUILD_WRKSRC}

EXAMPLEDIRS=	01.HelloWorld 02.Quake3Map 03.CustomSceneNode 04.Movement \
		05.UserInterface 06.2DGraphics 07.Collision 08.SpecialFX \
		09.Meshviewer 10.Shaders 11.PerPixelLighting \
		12.TerrainRendering 13.RenderToTexture 15.LoadIrrFile Demo

OPTIONS_DEFINE=	DEBUG EXAMPLES

DEBUG_MAKE_ENV_OFF=	NDEBUG=1

post-patch:
	@${REINPLACE_CMD} -e '/#define.*_IRR_USE_NON_SYSTEM_JPEG_LIB_/ d' \
		-e '/#define.*_IRR_USE_NON_SYSTEM_LIB_PNG_/ d' \
		-e '/#define.*_IRR_USE_NON_SYSTEM_ZLIB_/ d' \
		-e '/#define.*_IRR_USE_NON_SYSTEM_BZLIB_/ d' \
		-e '/#define.*_IRR_COMPILE_WITH_JOYSTICK_EVENTS_/ d' \
		${WRKSRC}/include/IrrCompileConfig.h

post-install-EXAMPLES-on:
	cd ${WRKSRC}/examples && ${COPYTREE_SHARE} "${EXAMPLEDIRS}" \
		${FAKE_DESTDIR}${EXAMPLESDIR} \
		"( -name Makefile -or -name *\.cpp -or -name *\.h )"
	cd ${WRKSRC} && ${COPYTREE_SHARE} media ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
