PORTNAME=	bible_names-fpw
PORTVERSION=	1.1.3
PORTREVISION=	0
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/bible_names/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dictionary for HITCHCOCK'S BIBLE NAMES (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	NONE

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/biblenam
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/bible_names-fpw/biblenam/data
	${INSTALL_DATA} ${WRKSRC}/biblenam/data/honmon \
		${PREFIX}/share/dict/bible_names-fpw/biblenam/data
	${INSTALL_DATA} ${WRKSRC}/catalogs \
		${PREFIX}/share/dict/bible_names-fpw
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme ${DOCSDIR}

.include <bsd.port.mk>
