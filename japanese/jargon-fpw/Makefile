PORTNAME=	jargon-fpw
PORTVERSION=	2.0
PORTREVISION=	0
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/jargon/
DISTNAME=	jargon-fpw${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The famous jargon file (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	NONE

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/jargon
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/jargon-fpw/jargon/data
	@${MKDIR} ${PREFIX}/share/dict/jargon-fpw/jargon/gaiji
	${INSTALL_DATA} ${WRKSRC}/jargon/data/honmon \
		${PREFIX}/share/dict/jargon-fpw/jargon/data
	${INSTALL_DATA} ${WRKSRC}/jargon/gaiji/gai16f \
		${PREFIX}/share/dict/jargon-fpw/jargon/gaiji
	${INSTALL_DATA} ${WRKSRC}/jargon/gaiji/gai16h \
		${PREFIX}/share/dict/jargon-fpw/jargon/gaiji
	${INSTALL_DATA} ${WRKSRC}/catalogs \
		${PREFIX}/share/dict/jargon-fpw
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} readme.1st readme.txt \
		${DOCSDIR})

.include <bsd.port.mk>
