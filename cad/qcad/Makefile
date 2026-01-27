PORTNAME=	qcad
PORTVERSION=	3.32.2.0
DISTVERSIONPREFIX=	v
#PORTREVISION=	1
CATEGORIES=	cad
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Professional CAD system
WWW=		https://www.ribbonsoft.com/qcad.html

LICENSE=	gpl3

BROKEN_i386=    doesn't build on magus

BUILD_DEPENDS=	bash:shells/bash	\
		${LOCALBASE}/lib/libopenNURBS.a:graphics/opennurbs

#USES=		compiler:c++11-lang gl gmake qmake qt:${FLAVOR:S/qt//}
USES=		compiler:c++11-lang gl gmake qmake qt:5
USE_CXXSTD=	c++14
#FLAVORS=	qt5 qt6
#FLAVOR?=	qt6
qt5_PKGNAMESUFFIX=	-qt5
#qt6_PKGNAMESUFFIX=	-qt6
USE_GITHUB=	yes
USE_LDCONFIG=	yes
_USE_QT5=	buildtools qmake:build \
		concurrent designer gui help imageformats network opengl script \
		scripttools sql svg uitools xml xmlpatterns
#_USE_QT6=	base tools script
#USE_QT=		${_USE_QT${FLAVOR:S/qt//}}
USE_QT=		${_USE_QT5}
USE_GL=		glu

DESKTOP_ENTRIES="QCad"	\
		"" \
		"${DATADIR}/scripts/qcad_icon.png"	\
		"${PREFIX}/bin/qcad-bin"	\
		""	\
		true

.if defined(WITH_DEBUG)
RESDIR=		${WRKSRC}/debug
.else
RESDIR=		${WRKSRC}/release
.endif

SHRLIBS=	qcadcore qcadecmaapi qcadentity qcadgrid qcadgui qcadoperations	\
		qcadsnap qcadspatialindex qcadstemmer spatialindexnavel
STALIBS=	dxflib stemmer
SHRDIR=		fonts libraries linetypes patterns plugins scripts themes ts
#QSCRIPTS should not be installed to avoid conflicts with texlive-base
QSCRIPTS=	bbox dwg2bmp dwg2pdf dwg2svg

OPTIONS_DEFINE=	EXAMPLES

CFLAGS_i386=	-fPIC
CXXFLAGS_i386=	-fPIC
LDFLAGS_i386=	-Wl,-z,notext

.include <bsd.mport.options.mk>

.if defined(WITH_DEBUG)
ALL_TARGET=	debug
PLIST_SUB+=	DEBUG_LIB_SUFFIX="_debug"
RESDIR=		${WRKSRC}/debug
.else
ALL_TARGET=	release
PLIST_SUB+=	DEBUG_LIB_SUFFIX=""
RESDIR=		${WRKSRC}/release
.endif

pre-configure:
	${MKDIR} ${WRKSRC}/src/3rdparty/qt-labs-qtscriptgenerator-${_QT_VERSION}
	${CP} ${WRKSRC}/src/3rdparty/qt-labs-qtscriptgenerator-5.13.2/qt-labs-qtscriptgenerator-5.13.2.pro \
		${WRKSRC}/src/3rdparty/qt-labs-qtscriptgenerator-${_QT_VERSION}/qt-labs-qtscriptgenerator-${_QT_VERSION}.pro
	${REINPLACE_CMD} -e "s|%%DATADIR%%|${DATADIR}|"	\
		${WRKSRC}/src/core/RS.cpp
	${REINPLACE_CMD} -e "s|%%DATADIR%%|${DATADIR}|"	\
		${WRKSRC}/src/core/RSettings.cpp

do-install:
	${INSTALL_PROGRAM} ${RESDIR}/qcad-bin ${STAGEDIR}${PREFIX}/bin/
	${LN} -sf qcad-bin ${STAGEDIR}${PREFIX}/bin/qcad
.for lib in ${SHRLIBS:C|^|lib|:C|$|.so|}
	${INSTALL_LIB} ${RESDIR}/${lib} ${STAGEDIR}${PREFIX}/lib/${lib}.0
	${LN} -sf ${lib}.0 ${STAGEDIR}${PREFIX}/lib/${lib}
.endfor
.for lib in ${STALIBS:C|^|lib|:C|$|.a|}
	${INSTALL_DATA} ${RESDIR}/${lib} ${STAGEDIR}${PREFIX}/lib/
.endfor
	${MKDIR} ${STAGEDIR}${DATADIR}
.for dir in ${SHRDIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} ${dir} ${STAGEDIR}${DATADIR}
.endfor
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
