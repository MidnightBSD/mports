PORTNAME=	ne
PORTVERSION=	3.05
PORTREVISION=	1
CATEGORIES=	japanese editors
MASTER_SITES=	http://hp.vector.co.jp/authors/VA018758/archive/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VZ-like full-screen text editor with Japanese support
WWW=		https://hp.vector.co.jp/authors/VA018758/ne/

LICENSE=	gpl2

USES=		ncurses
GNU_CONFIGURE=	yes
CFLAGS+=	-Wno-error=return-type		# required for Clang
WRKSRC=		${WRKDIR}/${PORTNAME}

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/ne ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/src/ne_en.1 ${STAGEDIR}${PREFIX}/share/man/man1/ne.1
	${INSTALL_MAN} ${WRKSRC}/src/ne.1 ${STAGEDIR}${PREFIX}/share/man/ja/man1
	@${MKDIR} ${STAGEDIR}${ETCDIR}
.for i in key* nerc* term*
	${INSTALL_DATA} ${WRKSRC}/etc/${i} ${STAGEDIR}${ETCDIR}
.endfor

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in BUGS.jp CHANGES.jp HISTORY.jp INSTALL.jp README.jp TODO.jp
	${INSTALL_DATA} ${WRKSRC}/${i} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
