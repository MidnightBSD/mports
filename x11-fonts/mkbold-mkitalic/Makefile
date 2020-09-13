# Created by: KOMATSU Shinichiro

PORTNAME=	mkbold-mkitalic
PORTVERSION=	0.11
CATEGORIES=	x11-fonts
MASTER_SITES=	http://hp.vector.co.jp/authors/VA013651/lib/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programs to make BDF font bold/italic

LICENSE=	unknown

FAKE_OPTS=	trueprefix

CONFLICTS=	mkbold-[0-9]* mkitalic-[0-9]*

PLIST_FILES=	bin/mkbold bin/mkitalic bin/mkbolditalic
PORTDOCS=	ALGORITHM ALGORITHM.eucJP LICENSE README README.eucJP
USES=	tar:bzip2

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC}; ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
