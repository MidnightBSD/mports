# $MidnightBSD$
# $FreeBSD: head/x11-toolkits/qt5-quickcontrols/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=	quickcontrols
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of controls for building complete interfaces in Qt Quick

LICENSE=	gpl3

USE_QT5=	core gui qml quick widgets \
		buildtools_build
QT_DIST=	quickcontrols
USES=		qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
