# $MidnightBSD$
# $FreeBSD: head/graphics/qt5-svg/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=	svg
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt SVG support module

LICENSE=	gpl3

USE_QT5=	core gui widgets buildtools_build
QT_DIST=	${PORTNAME}
USES=		qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
