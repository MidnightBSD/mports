# $MidnightBSD$
# $FreeBSD: head/graphics/qt5-opengl/Makefile 403678 2015-12-13 17:15:59Z rakuco $

PORTNAME=	opengl
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5-compatible OpenGL support module

LICENSE=	gpl3

USE_GL=		gl
USE_QT5=	core gui widgets qmake_build buildtools_build
QT_DIST=	base
HAS_CONFIGURE=	yes
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

QT_DEFINES=	OPENGL
QT_CONFIG=	opengl

.include <bsd.port.mk>
