PORTNAME=	tidy4
PORTVERSION=	20000804
PORTREVISION=	5
CATEGORIES=	www
MASTER_SITES=	http://www.w3.org/People/Raggett/
DISTNAME=	tidy4aug00

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fixes and tidies up HTML files
WWW=		https://www.w3.org/People/Raggett/tidy/

LICENSE=	bsd2
LICENSE_FILE=	${FILESDIR}/COPYRIGHT

USES=		tar:tgz
ALL_TARGET=	tidy
PORTDOCS=	Overview.html tidy.gif release-notes.html grid.gif

OPTIONS_DEFINE=	DOCS

do-configure:
	${REINPLACE_CMD} -e 's|tidy|tidy4|' ${WRKSRC}/man_page.txt

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/tidy ${PREFIX}/bin/tidy4
	@${INSTALL_MAN}	${WRKSRC}/man_page.txt	${PREFIX}/man/man1/tidy4.1

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
