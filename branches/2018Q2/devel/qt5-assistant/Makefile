# $MidnightBSD$
# $FreeBSD: head/devel/qt5-assistant/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=	assistant
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5 documentation browser

LICENSE=	gpl3

USE_QT5=	core gui help network printsupport sql webkit widgets \
		buildtools_build sql-sqlite3_run
QT_DIST=	tools
USES=		qmake

DESKTOP_ENTRIES="Qt 5 Assistant" "" \
		"${PREFIX}/share/pixmaps/assistant-qt5.png" \
		"${PREFIX}/${QT_BINDIR_REL}/assistant" \
		"Development;Qt;" true

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}/${PORTNAME}
INSTALL_WRKSRC=	${WRKSRC}/src/${PORTNAME}/${PORTNAME}

post-install:
	${INSTALL_DATA} ${INSTALL_WRKSRC}/images/assistant-128.png \
		${STAGEDIR}${PREFIX}/share/pixmaps/assistant-qt5.png

.include <bsd.port.mk>
