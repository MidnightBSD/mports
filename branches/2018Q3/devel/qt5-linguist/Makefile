# $MidnightBSD$
# $FreeBSD: head/devel/qt5-linguist/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=	linguist
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5 translation tool

LICENSE=	gpl3

USE_QT5=	core gui printsupport widgets xml \
		assistant_run linguisttools_run \
		buildtools_build designer_build uitools_build
QT_DIST=	tools
USES=		qmake

DESKTOP_ENTRIES="Qt 5 Linguist" "" \
		"${PREFIX}/share/pixmaps/linguist-qt5.png" \
		"${PREFIX}/${QT_BINDIR_REL}/linguist" \
		"Development;Qt;" true

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}/${PORTNAME}
INSTALL_WRKSRC=	${WRKSRC}/src/${PORTNAME}/${PORTNAME}

post-install:
	${INSTALL_DATA} ${BUILD_WRKSRC}/images/icons/linguist-128-32.png \
		${STAGEDIR}${PREFIX}/share/pixmaps/linguist-qt5.png

.include <bsd.port.mk>
