PORTNAME=	cabextract
PORTVERSION=	1.11
CATEGORIES=	archivers
MASTER_SITES=	http://www.cabextract.org.uk/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program to extract Microsoft cabinet (.CAB) files
WWW=		https://www.cabextract.org.uk/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe iconv
GNU_CONFIGURE=	yes

PLIST_FILES=	bin/cabextract \
		man/ja/man1/cabextract.1.gz \
		man/man1/cabextract.1.gz
DOCS=		AUTHORS ChangeLog NEWS README TODO
DOC_DOCS=	magic wince_cab_format.html
SRC_DOCS=	wince_info wince_rename
PORTDOCS=	${DOCS} ${DOC_DOCS} ${SRC_DOCS}

OPTIONS_DEFINE=	DOCS

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/cabextract.1 ${STAGEDIR}${MAN1PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/doc/ja/cabextract.1 ${STAGEDIR}${MAN1PREFIX}/man/ja/man1
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for i in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.for i in ${DOC_DOCS}
	@${INSTALL_DATA} ${WRKSRC}/doc/${i} ${DOCSDIR}
.endfor
.for i in ${SRC_DOCS}
	@${INSTALL_DATA} ${WRKSRC}/src/${i} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
