PORTNAME=	ebd-fpw
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/ebd/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easton's 1897 Bible Dictionary (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	NONE

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/ebd
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/ebd-fpw/ebd/data
	${INSTALL_DATA} ${WRKSRC}/ebd/data/honmon \
		${PREFIX}/share/dict/ebd-fpw/ebd/data
	${INSTALL_DATA} ${WRKSRC}/catalogs ${PREFIX}/share/dict/ebd-fpw
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} readme.1st readme.txt \
		${DOCSDIR})

.include <bsd.port.mk>
