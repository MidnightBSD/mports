# Created by: Matthew Seaman

PORTNAME=	GentiumBasic
PORTVERSION=	1102
CATEGORIES=	x11-fonts
MASTER_SITES=	http://software.sil.org/downloads/gentium/
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gentium Basic and Gentium Book Basic TrueType fonts

LICENSE=	OFL11

USES=		fonts zip
NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	${FONTSDIR}/GenBasB.ttf \
		${FONTSDIR}/GenBasBI.ttf \
		${FONTSDIR}/GenBasI.ttf \
		${FONTSDIR}/GenBasR.ttf \
		${FONTSDIR}/GenBkBasB.ttf \
		${FONTSDIR}/GenBkBasBI.ttf \
		${FONTSDIR}/GenBkBasI.ttf \
		${FONTSDIR}/GenBkBasR.ttf

SUB_FILES=	pkg-message

DOCSLIST=	FONTLOG.txt GENTIUM-FAQ.txt OFL-FAQ.txt
PORTDOCS=	${DOCSLIST:C,^.*/,,}

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCSLIST:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
