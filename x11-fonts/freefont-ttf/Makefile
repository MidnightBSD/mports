# Created by: Andreas Kohn <andreas@syndrom23.de>

PORTNAME=	freefont-ttf
PORTVERSION=	20120503
CATEGORIES=	x11-fonts
MASTER_SITES=	GNU/freefont

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free UCS Outline Fonts

LICENSE=	gpl3

USES=		fonts zip

WRKSRC=		${WRKDIR}/freefont-${PORTVERSION}
PORTDOCS=	AUTHORS ChangeLog CREDITS README
NO_BUILD=	yes

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	cd ${WRKSRC} && \
	${INSTALL_DATA} *.ttf ${STAGEDIR}${FONTSDIR}

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
