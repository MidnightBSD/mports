PORTNAME=	wordnet-fpw
PORTVERSION=	${WN_VER}.${WNFPW_VER}
PORTREVISION=	0
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/wordnet/
DISTNAME=	wordnet-${WN_VER}-fpw${WNFPW_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	English - English Dictionary (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	other

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/wordnet
EXTRACT_BEFORE_ARGS=	-qL
WNFPW_VER=	1.1.3
WN_VER=		1.6

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/wordnet-fpw/wordnet/data
	${INSTALL_DATA} ${WRKSRC}/wordnet/data/honmon \
		${PREFIX}/share/dict/wordnet-fpw/wordnet/data
	${INSTALL_DATA} ${WRKSRC}/catalogs \
		${PREFIX}/share/dict/wordnet-fpw
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme ${DOCSDIR}

.include <bsd.port.mk>
