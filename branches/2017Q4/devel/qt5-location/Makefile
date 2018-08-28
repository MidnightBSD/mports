# $MidnightBSD$
# $FreeBSD: head/devel/qt5-location/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=  	location
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt location module

LICENSE=	gpl3

USE_QT5=	core dbus gui network qml quick buildtools_build
QT_DIST=	${PORTNAME}
USES=		qmake

USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
