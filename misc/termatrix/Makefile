# Created by: chinsan

PORTNAME=	termatrix
PORTVERSION=	0.2
CATEGORIES=	misc
MASTER_SITES=	FREEBSD_LOCAL/chinsan \
		http://lightless.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Emulates Matrix terminal's "green tears" effect

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

PLIST_FILES=	bin/termatrix
PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

do-build:
	${CC} ${CFLAGS} ${CPPFLAGS} -o ${WRKSRC}/termatrix \
		${WRKSRC}/termatrix.c ${LDFLAGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/termatrix ${STAGEDIR}${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
