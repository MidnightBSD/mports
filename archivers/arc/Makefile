PORTNAME=	arc
PORTVERSION=	5.21q
CATEGORIES=	archivers
MASTER_SITES=	https://github.com/ani6al/arc/archive/5.21q/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create & extract files from DOS .ARC files

LICENSE=	gpl2
WWW=		https://github.com/ani6al/arc

CONFLICTS_INSTALL= arcanist-php[0-9][0-9]

PLIST_FILES=	bin/arc bin/marc share/man/man1/arc.1.gz
PORTDOCS=	Arc521.doc

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/arc ${WRKSRC}/marc ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/arc.1 ${PREFIX}/share/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/Arc521.doc ${DOCSDIR}
.endif

.include <bsd.port.mk>
