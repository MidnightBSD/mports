# $MidnightBSD$
# $FreeBSD: head/devel/qt5-scripttools/Makefile 372179 2014-11-05 09:39:21Z rakuco $

PORTNAME=	scripttools
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt Script additional components

LICENSE=	gpl3

USE_QT5=	core gui script widgets buildtools_build
QT_DIST=	script
USES=		qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${WRKSRC}/src/${PORTNAME}

.include <bsd.port.mk>
