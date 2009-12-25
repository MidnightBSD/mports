# $MidnightBSD: mports/archivers/arc/Makefile,v 1.2 2008/03/11 23:40:21 laffer1 Exp $

PORTNAME=	arc
PORTVERSION=	5.21o
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create & extract files from DOS .ARC files
LICENSE=	gpl2

PLIST_FILES=	bin/arc bin/marc
PORTDOCS=	Arc521.doc
MAN1=		arc.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/arc ${WRKSRC}/marc ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/arc.1 ${MANPREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/Arc521.doc ${DOCSDIR}
.endif

.include <bsd.port.mk>
