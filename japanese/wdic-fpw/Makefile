PORTNAME=	wdic-fpw
PORTVERSION=	1.4
PORTREVISION=	0
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/wdic/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wired and Wireless Dictionary in Japanese (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	other

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/wdic
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/wdic-fpw/wdic/data
	@${MKDIR} ${PREFIX}/share/dict/wdic-fpw/wdic/gaiji
	${INSTALL_DATA} ${WRKSRC}/wdic/data/honmon \
		${PREFIX}/share/dict/wdic-fpw/wdic/data
	${INSTALL_DATA} ${WRKSRC}/wdic/gaiji/gai16h \
		${PREFIX}/share/dict/wdic-fpw/wdic/gaiji
	${INSTALL_DATA} ${WRKSRC}/catalogs \
		${PREFIX}/share/dict/wdic-fpw
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} readme.1st readme.txt \
		${DOCSDIR})

.include <bsd.port.mk>
