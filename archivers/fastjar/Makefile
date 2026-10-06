PORTNAME=	fastjar
PORTVERSION=	0.98
CATEGORIES=	archivers java
MASTER_SITES=	SAVANNAH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Version of JDK's `jar' command written entirely in C
WWW=		https://savannah.nongnu.org/projects/fastjar/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake makeinfo
GNU_CONFIGURE=	yes
PORTDOCS=	CHANGES ChangeLog NEWS README
PLIST_FILES=	bin/fastjar bin/grepjar lib/charset.alias \
		share/man/man1/fastjar.1.gz share/man/man1/grepjar.1.gz

INFO=		fastjar

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
