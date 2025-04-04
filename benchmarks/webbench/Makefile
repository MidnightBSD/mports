PORTNAME=	webbench
PORTVERSION=	1.5
PORTREVISION=	1
CATEGORIES=	benchmarks www
MASTER_SITES=	SUNSITE/apps/www/servers

MAINTAINER=	ports@MidightBSD.org
COMMENT=	Simple forking web benchmark
WWW=		http://home.tiscali.cz/~cz210552/webbench.html

LICENSE=	gpl2

MAKE_ARGS=	CFLAGS="${CPPFLAGS} ${CFLAGS}"

PORTDOCS=	ChangeLog

PLIST_FILES=	bin/webbench \
		share/man/man1/webbench.1.gz

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/webbench ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/webbench.1 ${STAGEDIR}${PREFIX}/share/man/man1

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/ChangeLog ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
