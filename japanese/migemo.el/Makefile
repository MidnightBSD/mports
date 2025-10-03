PORTNAME=	migemo.el
PORTVERSION=	1.9.2
PORTREVISION=	0
CATEGORIES=	japanese elisp
PKGNAMESUFFIX=	${EMACS_PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese incremental search tool for Emacs
WWW=		https://github.com/emacs-jp/migemo

LICENSE=	gpl2

RUN_DEPENDS=	cmigemo:japanese/cmigemo

USES=		emacs
USE_GITHUB=	yes
GH_ACCOUNT=	emacs-jp
GH_PROJECT=	migemo
GH_TAGNAME=	e4744ef

CONFLICTS=	ja-migemo-emacs
NO_ARCH=	yes
NO_BUILD=	yes
PLIST_FILES=	${EMACS_SITE_LISPDIR}/migemo.el
PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_DATA} ${WRKSRC}/migemo.el ${STAGEDIR}${PREFIX}/${EMACS_SITE_LISPDIR}

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
