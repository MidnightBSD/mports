PORTNAME=	tree
DISTVERSION=	2.2.1
CATEGORIES=	sysutils
MASTER_SITES=	https://oldmanprogrammer.net/tar/tree/ \
		https://fossies.org/linux/misc/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display a tree-view of directories with optional color or HTML output
WWW=		https://oldmanprogrammer.net/source.php?dir=projects/tree

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gmake tar:tgz
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"

PLIST_FILES=	bin/tree \
		share/man/man1/tree.1.gz
PORTDOCS=	CHANGES README TODO

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tree ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/*.1 ${STAGEDIR}${PREFIX}/share/man/man1

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
