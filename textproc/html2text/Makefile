PORTNAME=	html2text
PORTVERSION=	1.3.2a
CATEGORIES=	textproc
MASTER_SITES=	SUNSITE/apps/www/converters \
		http://www.mbayer.de/html2text/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts HTML documents into plain text

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

HAS_CONFIGURE=	yes
MAKE_ARGS=	CXX="${CXX}"

PORTDOCS=	CHANGES CREDITS KNOWN_BUGS README TODO
PLIST_FILES=	bin/html2text man/man1/html2text.1.gz man/man5/html2textrc.5.gz

CONFLICTS=	py27-html2text-[0-9]*

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e '/echo=/s/ -e//' ${WRKSRC}/configure
.for fle in Makefile.in libstd/Makefile.in
	@${REINPLACE_CMD} -e '/^DEBUG/s/^/#/; \
		 /^CXXFLAGS/s/=/+=/' ${WRKSRC}/${fle}
.endfor
.for fle in Area.h HTMLControl.h Properties.h format.h
	@${REINPLACE_CMD} -e 's/<istream>/<iostream>/' ${WRKSRC}/${fle}
.endfor

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/html2text ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/html2text.1.gz ${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/html2textrc.5.gz ${MANPREFIX}/man/man5

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for fle in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${fle} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
