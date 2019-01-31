# $MidnightBSD$
# $FreeBSD: head/textproc/clucene-qt5/Makefile 416768 2016-06-12 06:37:59Z pi $

PORTNAME=	clucene
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	textproc
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt bindings for the CLucene full-text search library

LICENSE=	gpl3

USE_QT5=	core buildtools_build
QT_DIST=	tools
USES=		qmake pathfix
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/assistant/${PORTNAME}
INSTALL_WRKSRC=	${WRKSRC}/src/assistant/${PORTNAME}

.include <bsd.port.mk>
