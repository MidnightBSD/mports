# $MidnightBSD: mports/devel/qt4-moc/Makefile,v 1.5 2013/06/21 23:29:50 laffer1 Exp $

PORTNAME=	moc
DISTVERSION=	${QT4_VERSION}
CATEGORIES?=	devel
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt meta object compiler
LICENSE=	gpl3

FAKE_OPTS+=	trueprefix

USE_QT4=	qmake_build
QT_NONSTANDARD=	yes
QT_DIST=	yes
MAKE_JOBS_SAFE=	yes

HAS_CONFIGURE=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib:$$LD_LIBRARY_PATH \
		PATH=${WRKSRC}/bin:$$PATH

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake tools translations \
		src/activeqt src/dbus src/gui src/multimedia src/network \
		src/opengl src/openvg src/phonon src/qt3support \
		src/s60installs src/s60main src/script src/scripttools src/sql \
		src/svg src/testlib src/winmain src/xmlpatterns \
		src/3rdparty/clucene src/3rdparty/freetype \
		src/3rdparty/libjpeg src/3rdparty/libmng src/3rdparty/libpng \
		src/3rdparty/libtiff src/3rdparty/phonon src/3rdparty/webkit
#.for dne in ${DO_NOT_EXTRACT}
#EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
#.endfor

BUILD_WRKSRC=	${WRKSRC}/src/tools/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

EXTRA_PATCHES=	${.CURDIR}/../../devel/qt4/files/patch-configure

pre-configure:
	${REINPLACE_CMD} -e 's|target.path.*|target.path=${FAKE_DESTDIR}${PREFIX}/bin|g' \
			-e 's|^TARGET.*|TARGET=moc-qt4|g' \
		${BUILD_WRKSRC}/${PORTNAME}.pro
	${MKDIR} ${WRKSRC}/mkspecs
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/bin/qmake

pre-build:
	cd ${BUILD_WRKSRC}/../bootstrap && ${MAKE} ${FAKE_MAKEARGS}

.include <bsd.port.mk>
