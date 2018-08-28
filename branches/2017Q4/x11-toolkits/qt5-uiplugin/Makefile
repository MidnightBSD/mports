# $MidnightBSD$
# $FreeBSD: head/x11-toolkits/qt5-uiplugin/Makefile 407203 2016-01-25 11:28:37Z rakuco $

PORTNAME=	uiplugin
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	x11-toolkits devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Custom Qt widget plugin interface for Qt Designer

LICENSE=	gpl3

USE_QT5=	core gui widgets
QT_DIST=	tools
USES=		qmake

BUILD_WRKSRC=   ${WRKSRC}/src/designer/src/${PORTNAME}
INSTALL_WRKSRC= ${WRKSRC}/src/designer/src/${PORTNAME}

.include <bsd.port.mk>
