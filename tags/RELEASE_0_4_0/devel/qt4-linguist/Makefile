# $MidnightBSD: mports/devel/qt4-linguist/Makefile,v 1.3 2011/07/17 15:22:02 laffer1 Exp $
# $FreeBSD: ports/devel/qt4-linguist/Makefile,v 1.21 2010/12/02 19:47:08 makc Exp $

PORTNAME=	linguist
DISTVERSION=	${QT4_VERSION}
CATEGORIES?=	devel
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt localisation tool
LICENSE=	gpl3

USE_QT4=	qmake_build designer_build moc_build rcc_build uic_build \
		assistant_run gui network xml
QT_NONSTANDARD=	yes
QT_DIST=	yes
MAKE_JOBS_SAFE=	yes

HAS_CONFIGURE=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib:$$LD_LIBRARY_PATH \
		PATH=${WRKSRC}/bin:$$PATH

DESKTOP_ENTRIES="Qt Linguist" "${COMMENT}" \
		"${PREFIX}/share/pixmaps/linguist-qt4.png" \
		"${PREFIX}/bin/linguist-qt4" "Development;Qt;" true

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake translations \
		src/activeqt src/dbus src/multimedia src/network src/opengl \
		src/openvg src/phonon src/qt3support src/s60installs \
		src/s60main src/script src/scripttools src/sql src/svg \
		src/testlib src/tools src/winmain src/xmlpatterns \
		src/3rdparty/clucene src/3rdparty/freetype \
		src/3rdparty/libjpeg src/3rdparty/libmng src/3rdparty/libpng \
		src/3rdparty/libtiff src/3rdparty/phonon src/3rdparty/webkit
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

BUILD_WRKSRC=	${WRKSRC}/tools/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

EXTRA_PATCHES=	${.CURDIR}/../../devel/qt4/files/patch-configure

pre-configure:
	${REINPLACE_CMD} -E -e 's|^TARGET[[:blank:]]*=[[:blank:]]*([a-z]+)|TARGET=\1-qt4|g' \
		${BUILD_WRKSRC}/${PORTNAME}.pro ${BUILD_WRKSRC}/${PORTNAME}/${PORTNAME}.pro \
		${BUILD_WRKSRC}/lrelease/lrelease.pro ${BUILD_WRKSRC}/lupdate/lupdate.pro
	${MKDIR} ${WRKSRC}/mkspecs
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${WRKSRC}/bin/moc
	${LN} -sf ${LOCALBASE}/bin/uic-qt4 ${WRKSRC}/bin/uic
	${LN} -sf ${LOCALBASE}/bin/rcc ${WRKSRC}/bin/rcc

post-install:
	${INSTALL_DATA} ${BUILD_WRKSRC}/linguist/images/icons/linguist-128-32.png \
		${PREFIX}/share/pixmaps/linguist-qt4.png

.include <bsd.port.mk>
