# $MidnightBSD$
# $FreeBSD: head/graphics/qt5-3d/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=  	3d
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt3D module

LICENSE=	gpl3

LIB_DEPENDS=	libassimp.so.3:multimedia/assimp

# Base GCC fails to build the code, pull in a more recent compiler.
USES=		compiler:c++0x pkgconfig qmake
USE_QT5=	concurrent core gui qml quick buildtools_build
QT_DIST=	${PORTNAME}

USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
