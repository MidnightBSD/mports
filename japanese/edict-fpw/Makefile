PORTNAME=	edict-fpw
PORTVERSION=	1.2.2
PORTREVISION=	0
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/edict/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese <-> English Dictionary (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	NONE

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/edict
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/edict-fpw/edict/data
	${INSTALL_DATA} ${WRKSRC}/edict/data/honmon \
		${PREFIX}/share/dict/edict-fpw/edict/data
	${INSTALL_DATA} ${WRKSRC}/catalogs \
		${PREFIX}/share/dict/edict-fpw
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} readme.pkg edict.txt \
		${DOCSDIR})

.include <bsd.port.mk>
