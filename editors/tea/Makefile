PORTNAME=	tea
PORTVERSION=	62.0.2
CATEGORIES=	editors

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple and powerful Qt-based text editor
WWW=		http://semiletov.org/tea/

LICENSE=	gpl3

USES=		compiler:c++11-lang gl gmake pkgconfig:build qmake qt:5 xorg

OPTIONS_DEFINE=		DOCS
OPTIONS_GROUP=		SPELL
OPTIONS_GROUP_SPELL=	ASPELL HUNSPELL
OPTIONS_DEFAULT=	ASPELL HUNSPELL
SPELL_DESC=		Spell checker backend

USE_QT=		buildtools:build core declarative gui network widgets printsupport
USE_GL=		gl
USE_LOCALE=	en_US.UTF-8

USE_GITHUB=	yes
GH_ACCOUNT=	psemiletov
GH_PROJECT=	${PORTNAME}-qt

LDFLAGS+=	-lz
PLIST_FILES=	bin/tea share/pixmaps/tea_icon_v2.png
PORTDOCS=	*

DESKTOP_ENTRIES="TEA" "" "${PREFIX}/share/pixmaps/tea_icon_v2.png" \
		"${PORTNAME}" "" ""

ASPELL_LIB_DEPENDS=	libaspell.so:textproc/aspell
ASPELL_QMAKE_OFF=	CONFIG+=noaspell

HUNSPELL_LIB_DEPENDS=	libhunspell-1.7.so:textproc/hunspell
HUNSPELL_QMAKE_OFF=	CONFIG+=nohunspell

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/tea ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/icons/tea_icon_v2.png ${STAGEDIR}${PREFIX}/share/pixmaps
	(cd ${WRKSRC}/manuals \
		&& ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
