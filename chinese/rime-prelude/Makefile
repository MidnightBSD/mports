PORTNAME=	rime-prelude
DISTVERSION=	g20211023
CATEGORIES=	chinese textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Essential files for building up your Rime configuration
WWW=		https://github.com/rime/rime-prelude

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

OPTIONS_DEFINE=		DOCS
OPTIONS_SUB=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	rime
GH_TAGNAME=	4001edf96791bbb5663573ba79ba4b1e9c0b8626

NO_BUILD=	yes
NO_ARCH=	yes

PORTDOCS=	AUTHORS README.md

PLIST_FILES=	\
	share/rime-data/default.yaml \
	share/rime-data/key_bindings.yaml \
	share/rime-data/punctuation.yaml \
	share/rime-data/symbols.yaml

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/rime-data
	${INSTALL_DATA} ${WRKSRC}/default.yaml ${STAGEDIR}${PREFIX}/share/rime-data
	${INSTALL_DATA} ${WRKSRC}/key_bindings.yaml ${STAGEDIR}${PREFIX}/share/rime-data
	${INSTALL_DATA} ${WRKSRC}/punctuation.yaml ${STAGEDIR}${PREFIX}/share/rime-data
	${INSTALL_DATA} ${WRKSRC}/symbols.yaml ${STAGEDIR}${PREFIX}/share/rime-data

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/AUTHORS ${FAKE_DESTDIR}/${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/README.md ${FAKE_DESTDIR}/${DOCSDIR}

.include <bsd.port.mk>
