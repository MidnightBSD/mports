PORTNAME=	rime-emoji
DISTVERSION=	g20210909
CATEGORIES=	chinese textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rime emoji suggestions support
WWW=		https://github.com/rime/rime-emoji

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	rime
GH_TAGNAME=	fc13f2caf2f02de8a5096c9de3a003d0f9a9f5b4

NO_ARCH=	yes
NO_BUILD=	yes

PORTDOCS=	AUTHORS README.md

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/rime-data
	${INSTALL_DATA} ${WRKSRC}/emoji_suggestion.yaml ${STAGEDIR}${PREFIX}/share/rime-data
	(cd ${WRKSRC} && ${COPYTREE_SHARE} opencc ${STAGEDIR}${PREFIX}/share/rime-data)

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/AUTHORS ${FAKE_DESTDIR}/${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/README.md ${FAKE_DESTDIR}/${DOCSDIR}

.include <bsd.port.mk>
