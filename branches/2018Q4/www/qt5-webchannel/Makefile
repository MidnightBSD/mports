# $MidnightBSD$
# $FreeBSD: head/www/qt5-webchannel/Makefile 388182 2015-05-31 22:56:44Z alonso $

PORTNAME=	webchannel
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	www
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5 library for integration of C++/QML with HTML/js clients

LICENSE=	gpl3

USE_QT5=	buildtools_build core qml quick
QT_DIST=	${PORTNAME}
USES=		qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
