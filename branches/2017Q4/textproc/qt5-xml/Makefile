# $MidnightBSD$
# $FreeBSD: head/textproc/qt5-xml/Makefile 372179 2014-11-05 09:39:21Z rakuco $

PORTNAME=	xml
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	textproc
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt SAX and DOM implementations

LICENSE=	gpl3

USE_QT5=	core qmake_build buildtools_build
QT_DIST=	base
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-no-gui -no-xcb
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

.include <bsd.port.mk>
