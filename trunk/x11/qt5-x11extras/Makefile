# $MidnightBSD$
# $FreeBSD: head/x11/qt5-x11extras/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=	x11extras
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	x11
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt platform-specific features for X11-based systems

LICENSE=	gpl3

USE_QT5=	core gui
QT_DIST=	x11extras
USES=		qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
