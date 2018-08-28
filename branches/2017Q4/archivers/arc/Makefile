# $MidnightBSD$

PORTNAME=	arc
PORTVERSION=	5.21p
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create & extract files from DOS .ARC files
LICENSE=	gpl2

PLIST_FILES=	bin/arc bin/marc man/man1/arc.1.gz
PORTDOCS=	Arc521.doc

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/arc ${WRKSRC}/marc ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/arc.1 ${MANPREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/Arc521.doc ${DOCSDIR}
.endif

.include <bsd.port.mk>
