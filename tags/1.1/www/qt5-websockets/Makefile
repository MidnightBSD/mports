# $MidnightBSD$
# $FreeBSD: head/www/qt5-websockets/Makefile 406217 2016-01-16 12:51:05Z rakuco $

PORTNAME=	websockets
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	www
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt implementation of WebSocket protocol

LICENSE=	gpl3

USE_QT5=	buildtools_build core network qml quick
QT_DIST=	${PORTNAME}
USES=		qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
