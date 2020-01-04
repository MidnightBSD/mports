# $MidnightBSD$

PORTNAME=	zsync
PORTVERSION=	0.6.2
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://zsync.moria.org.uk/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A file transfer program

LICENSE=	artistic2

USES=		autoreconf tar:bzip2
GNU_CONFIGURE=	yes

PORTDOCS=	INSTALL NEWS README
PLIST_FILES=	bin/zsync bin/zsyncmake \
		man/man1/zsync.1.gz man/man1/zsyncmake.1.gz

MANPAGE=	zsync.1 zsyncmake.1
BINS=		zsync zsyncmake

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${BINS:S,^,${WRKSRC}/,} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${MANPAGE:S,^,${WRKSRC}/doc/,} \
		${STAGEDIR}${MANPREFIX}/man/man1

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
