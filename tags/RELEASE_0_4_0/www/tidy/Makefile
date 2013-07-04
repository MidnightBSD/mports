# $MidnightBSD: mports/www/tidy/Makefile,v 1.3 2008/06/13 04:21:48 laffer1 Exp $

PORTNAME=	tidy4
PORTVERSION=	20000804
PORTREVISION=	3
CATEGORIES=	www
MASTER_SITES=	http://www.w3.org/People/Raggett/
DISTNAME=	tidy4aug00
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fixes and tidies up HTML files
LICENSE=	other

MAN1=		tidy4.1
ALL_TARGET=	tidy
DOCFILES=	Overview.html tidy.gif release-notes.html grid.gif

do-configure:
	${REINPLACE_CMD} -e 's|tidy|tidy4|' ${WRKSRC}/man_page.txt

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/tidy ${PREFIX}/bin/tidy4
	@${INSTALL_MAN}	${WRKSRC}/man_page.txt	${PREFIX}/man/man1/tidy4.1
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing documentation for ${PKGNAME}"
	@${MKDIR} ${DOCSDIR}
.for docfile in ${DOCFILES}
	@${INSTALL_MAN} ${WRKSRC}/${docfile} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
