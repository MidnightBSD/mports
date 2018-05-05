# $MidnightBSD$
# $FreeBSD: head/comms/qt5-serialbus/Makefile 422306 2016-09-17 09:46:54Z rakuco $

PORTNAME=	serialbus
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	comms
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt functions to access industrial bus systems

LICENSE=	gpl3

USE_QT5=	core network serialport buildtools_build
QT_DIST=	serialbus
USES=		compiler:c++11-lib qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/serialbus
INSTALL_WRKSRC=	${BUILD_WRKSRC}

.include <bsd.port.mk>
