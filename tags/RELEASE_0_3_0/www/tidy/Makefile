# New ports collection makefile for:	tidy
# Date created:		27 Oct 1998
# Whom:			Abel Chow <achow@transoft.net>
#
# $MidnightBSD: mports/www/tidy/Makefile,v 1.2 2008/03/26 00:53:29 laffer1 Exp $
# $FreeBSD: ports/www/tidy/Makefile,v 1.24 2006/09/05 09:06:06 linimon Exp $
#

PORTNAME=	tidy
PORTVERSION=	20000804
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	http://www.w3.org/People/Raggett/
DISTNAME=	tidy4aug00
EXTRACT_SUFX=	.tgz

CONFLICTS=	tidy-devel-[0-9]* tidy-lib-[0-9]*

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fixes and tidies up HTML files
LICENSE=	other

MAN1=		tidy.1

ALL_TARGET=	tidy

DOCFILES=	Overview.html tidy.gif release-notes.html grid.gif

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/tidy ${PREFIX}/bin/tidy
	@${INSTALL_MAN}	${WRKSRC}/man_page.txt	${PREFIX}/man/man1/tidy.1
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing documentation for ${PKGNAME}"
	@${MKDIR} ${PREFIX}/share/doc/tidy
.for docfile in ${DOCFILES}
	@${INSTALL_MAN} ${WRKSRC}/${docfile} ${PREFIX}/share/doc/tidy
.endfor
.endif

.include <bsd.port.mk>
