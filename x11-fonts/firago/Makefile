PORTNAME=	firago
PORTVERSION=	1.001
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Expanded version of Fira Sans with support for additional languages

LICENSE=	OFL11

USES=		fonts xorg

USE_XORG=	x11
USE_GITHUB=	yes
GH_ACCOUNT=	bBoxType
GH_PROJECT=	FiraGO
GH_TAGNAME=	715cd3e
NO_ARCH=	yes
NO_BUILD=	yes

SUB_FILES=	pkg-message

PORTDOCS=	*.pdf

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${FONTSDIR}
	${FIND} ${WRKSRC}/Fonts -type f -name \*.otf | while read f; do \
		${INSTALL_DATA} $$f ${FONTSDIR} ; done

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/Technical\ Report\ PDF/*.pdf ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/FiraGO_FiraSans_Comparison.pdf \
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
