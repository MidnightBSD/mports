# $MidnightBSD$

PORTNAME=	mg
PORTVERSION=	20150323
CATEGORIES=	editors
MASTER_SITES=	http://homepage.boetes.org/software/mg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small, fast Emacs-like editor

LICENSE=	publicdom

PLIST_FILES=	bin/mg man/man1/mg.1.gz
PORTDOCS=	README tutorial

OPTIONS_DEFINE=	DOCS

pre-configure:
	@${REINPLACE_CMD} -e 's|__dead|__dead2|' ${WRKSRC}/main.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN}  ${WRKSRC}/${PORTNAME}.1 ${MAN1PREFIX}/man/man1
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
