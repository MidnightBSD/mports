PORTNAME=	quit
PORTVERSION=	1.2a
PORTREVISION=	3
CATEGORIES?=	games
MASTER_SITES=	https://fukuchi.org/archive/shortshort/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Bicycle with trailers like "sl"
WWW=		https://fukuchi.org/works/shortshort/ #quit

LICENSE=	other

USES=		ncurses

MANLANG=	ja
OPTIONS_DEFINE=	DOCS

do-build:
	${CC} ${CFLAGS} ${CPPFLAGS} -o ${WRKSRC}/quit \
		${WRKSRC}/quit.c ${LDFLAGS} -lncurses

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/quit ${STAGEDIR}${PREFIX}/bin
	${MKDIR} ${STAGEDIR}${PREFIX}/man/ja/man1
	${INSTALL_MAN} ${WRKSRC}/quit.1 ${STAGEDIR}${PREFIX}/share/man/ja/man1
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${WRKSRC}/quit.txt \
		${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
