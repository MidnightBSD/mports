PORTNAME=	assistant
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5 documentation browser

USES=		compiler:c++11-lang perl5 qmake qt-dist:5,tools
USE_PERL5=	build
USE_QT=		core gui help network printsupport sql widgets \
		buildtools:build sql-sqlite3:run
QT_BINARIES=	yes

DESKTOP_ENTRIES="Qt 5 Assistant" "" \
		"${PREFIX}/share/pixmaps/assistant-qt5.png" \
		"${PREFIX}/${QT_BINDIR_REL}/assistant" \
		"Development;Qt;" true

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}/${PORTNAME}
INSTALL_WRKSRC=	${WRKSRC}/src/${PORTNAME}/${PORTNAME}

# Link in QtHelp port
_QT5_ADDITIONAL_LINK=	help

post-install:
	${INSTALL_DATA} ${INSTALL_WRKSRC}/images/assistant-128.png \
		${PREFIX}/share/pixmaps/assistant-qt5.png

.include <bsd.port.mk>
