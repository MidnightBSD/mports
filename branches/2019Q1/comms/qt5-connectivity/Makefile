# $MidnightBSD$
# $FreeBSD: head/comms/qt5-connectivity/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=  	connectivity
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	comms
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt connectivity (Bluetooth/NFC) module

LICENSE=	gpl3

USE_QT5=	concurrent core qml quick buildtools_build
QT_DIST=	${PORTNAME}
USES=		qmake

USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
