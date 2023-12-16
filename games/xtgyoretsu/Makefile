PORTNAME=	xtgyoretsu
PORTVERSION=	git20140822
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extended ncurses version of "Renshu-cho gyoretsu"
WWW=		https://saahriktu.org/games.html \
		https://github.com/Penguinum/xtgyoretsu-forked

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	Penguinum
GH_PROJECT=	${PORTNAME}-forked
GH_TAGNAME=	d052143

USES=		ncurses

PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/Readme ${STAGEDIR}${DOCSDIR}/

.include <bsd.port.mk>
