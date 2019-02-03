# $MidnightBSD$
# $FreeBSD: head/devel/qt5-uitools/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=	uitools
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt Designer UI forms support module

LICENSE=	gpl3

USE_QT5=	core gui uiplugin widgets buildtools_build
QT_DIST=	tools
USES=		qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/designer/src/${PORTNAME}
INSTALL_WRKSRC=	${WRKSRC}/src/designer/src/${PORTNAME}

.include <bsd.port.mk>
