# $MidnightBSD$
# $FreeBSD: head/devel/qt5-qdoc/Makefile 418653 2016-07-16 20:47:42Z rakuco $

PORTNAME=	qdoc
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	devel textproc
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt documentation generator

LICENSE=	gpl3

USE_QT5=	core qml buildtools_build qdoc-data_run
QT_DIST=	tools
USES=		qmake

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

PLIST_FILES=	lib/qt5/bin/qdoc

.include <bsd.port.mk>
