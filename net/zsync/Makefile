PORTNAME=	zsync
PORTVERSION=	0.6.2
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://zsync.moria.org.uk/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File transfer program
WWW=		http://zsync.moria.org.uk/

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf tar:bzip2
GNU_CONFIGURE=	yes

PORTDOCS=	INSTALL NEWS README
PLIST_FILES=	bin/zsync bin/zsyncmake \
		share/man/man1/zsync.1.gz share/man/man1/zsyncmake.1.gz

MANPAGE=	zsync.1 zsyncmake.1
BINS=		zsync zsyncmake

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${BINS:S,^,${WRKSRC}/,} ${PREFIX}/bin
	${INSTALL_MAN} ${MANPAGE:S,^,${WRKSRC}/doc/,} \
		${PREFIX}/share/man/man1

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
