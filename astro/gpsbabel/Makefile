PORTNAME=	gpsbabel
DISTVERSIONPREFIX=	${PORTNAME}_
DISTVERSION=	1_10_0
CATEGORIES=	astro geography

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GPS file translating tool
WWW=		https://www.gpsbabel.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake:testing compiler:c++20-lang qt:6
USE_QT=		5compat base

CONFLICTS=	gpsbabel14

USE_GITHUB=	yes

CMAKE_ARGS=	-DGPSBABEL_WITH_LIBUSB=custom \
		-DGPSBABEL_EXTRA_LINK_LIBRARIES=usb

OPTIONS_DEFINE=	GUI
OPTIONS_SUB=	yes

GUI_USES=	gl
GUI_USE=	GL=gl,opengl \
		QT=declarative,positioning,serialport,webchannel,webengine \
		QT=tools:build
GUI_CMAKE_BOOL=	GPSBABEL_WITH_GUI

do-install:
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/gpsbabel ${PREFIX}/bin/

do-install-GUI-on:
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/gui/GPSBabelFE/gpsbabelfe \
		${FAKE_DESTDIR}${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/gui/gpsbabel.desktop \
		${FAKE_DESTDIR}${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/gui/images/appicon.png \
		${FAKE_DESTDIR}${PREFIX}/share/pixmaps/gpsbabel.png

.include <bsd.port.mk>
