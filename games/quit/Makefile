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
	${INSTALL_PROGRAM} ${WRKSRC}/quit ${PREFIX}/bin
	${MKDIR} ${PREFIX}/man/ja/man1
	${INSTALL_MAN} ${WRKSRC}/quit.1 ${PREFIX}/share/man/ja/man1
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${WRKSRC}/quit.txt \
		${DOCSDIR}

.include <bsd.port.mk>
