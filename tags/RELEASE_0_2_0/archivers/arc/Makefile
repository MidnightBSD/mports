# New ports collection makefile for:    arc
# Date created:         31 Dec 1994
# Whom:                 ache
#
# $MidnightBSD: mports/archivers/arc/Makefile,v 1.1 2006/09/17 23:39:10 laffer1 Exp $
# $FreeBSD: ports/archivers/arc/Makefile,v 1.21 2006/08/23 04:05:08 ache Exp $
#

PORTNAME=	arc
PORTVERSION=	5.21o
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
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
