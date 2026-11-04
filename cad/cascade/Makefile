PORTNAME=	cascade
PORTVERSION=	1.4
CATEGORIES=	cad
MASTER_SITES=	SF/rfcascade/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple tool to analyze noise and distortion of a RF system
WWW=		https://rfcascade.sourceforge.net/

GNU_CONFIGURE=	yes
USES=		groff
PORTDOCS=	ex1.gif index.html
PORTEXAMPLES=	README.examples ex1.cas ex1.gif ex1.out cascade-mode.el
PLIST_FILES=	bin/cascade share/man/man1/cascade.1.gz

CONFLICTS_INSTALL=	cascade-compiler

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/cascade ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/cascade.1 ${PREFIX}/share/man/man1
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/* \
		${WRKSRC}/cascade-mode.el ${EXAMPLESDIR}
	${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC}/doc && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}

.include <bsd.port.mk>
