PORTNAME=	gpsbabel
DISTVERSIONPREFIX=	${PORTNAME}_
DISTVERSION=	1_7_0
CATEGORIES=	astro geography

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GPS file translating tool
WWW=		https://www.gpsbabel.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c++11-lang gmake localbase qt:5
USE_QT=		core qmake:build

CONFLICTS=	gpsbabel14

USE_GITHUB=	yes
GNU_CONFIGURE=	yes

OPTIONS_DEFINE=	GUI
OPTIONS_SUB=	yes

GUI_USES=	gl
GUI_USE=	GL=gl \
		QT=declarative,gui,location,network,printsupport,webchannel \
		QT=webengine,widgets,xml,buildtools:build,linguisttools:build
GUI_ALL_TARGET=	gui
GUI_VARS=	MAKE_JOBS_UNSAFE=yes

CONFIGURE_ENV=	CC="${CC}" CXX="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
MAKE_ENV=	CC="${CC}" CXX="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"

do-build:
	(cd ${WRKSRC}; ${CONFIGURE_ENV} ${CONFIGURE_CMD}; ${MAKE_ENV} ${GMAKE})
do-build-GUI-on:
	(cd ${WRKSRC}/gui; ${QMAKE} USE_GUI=qt5; ${LRELEASE} *.ts; ${GMAKE})

post-patch:
	@${REINPLACE_CMD} '/langPath_ = / \
		s|QApplication::applicationDirPath()|"${DATADIR}"|' \
			${WRKSRC}/gui/mainwindow.cc
	@${RM} -r ${WRKSRC}/zlib/contrib/minizip

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/gpsbabel ${PREFIX}/bin/

do-install-GUI-on:
	${INSTALL_PROGRAM} ${WRKSRC}/gui/objects/gpsbabelfe \
		${FAKE_DESTDIR}${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/gui/gpsbabel.desktop \
		${FAKE_DESTDIR}${PREFIX}/share/applications/
	${MKDIR} ${FAKE_DESTDIR}${DATADIR}/translations
	${INSTALL_DATA} ${WRKSRC}/gui/*.qm ${FAKE_DESTDIR}${DATADIR}/translations/
	${INSTALL_DATA} ${WRKSRC}/gui/images/appicon.png \
		${FAKE_DESTDIR}${PREFIX}/share/pixmaps/gpsbabel.png

.include <bsd.port.mk>
